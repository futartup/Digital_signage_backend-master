import jwt
import base64
import json
import six
import struct
import logging

from django.core.cache import cache
from cryptography.hazmat.primitives.asymmetric.rsa import RSAPublicNumbers
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import serialization
from rest_framework_jwt.utils import jwt_decode_handler


#from Utility_functions.gps_logs_utils import add_entry_exit_logs

#log = logging.getLogger(__name__)


def intarr2long(arr):
    return int(''.join(["%02x" % byte for byte in arr]), 16)


def base64_to_long(data):
    if isinstance(data, six.text_type):
        data = data.encode("ascii")

    # urlsafe_b64decode will happily convert b64encoded data
    _d = base64.urlsafe_b64decode(bytes(data) + b'==')
    return intarr2long(struct.unpack('%sB' % len(_d), _d))

from django.http.response import JsonResponse
from django.conf import settings


routes_token_not_required = ['logout',
                             'admins',
                             'api-token-auth', 
                             'token', 
                             'media', 
                             'login', 
                             'dashboard',
                             'anup',
                             'shikha',
                             'dudu',
                             'create',
                             'playlist',
                             'maadeuta']
routes_token_not_required_on_methods = {
    '/api/signup/' : ['POST'],
}



def check_on_particular_method(request):
    if request.get_full_path() in routes_token_not_required_on_methods.keys():
        return not (request.method in routes_token_not_required_on_methods[request.get_full_path()])
    else:
        return False


def check_if_middleware_required(request):
    end_point_res = True
    for route in routes_token_not_required:
        if route in request.build_absolute_uri() or 'api' not in request.build_absolute_uri():
            end_point_res = False
    if request and request.path == '/':
        return False
    return end_point_res


class TokenValidationMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    #@add_entry_exit_logs
    def __call__(self, request):
        if check_if_middleware_required(request) or \
                check_on_particular_method(request):
            decoded_token = {}
            if "username" in request.GET:
                if cache.__contains__(request.GET.get("username")):
                    userdata = cache.get(request.GET.get("username"))
                else:
                    return JsonResponse(data={
                        "code": "Username is not logged in",
                        "description": "Authorization header is expected"},
                        status=401) 
            else:
                auth = request.META.get('HTTP_AUTHORIZATION')
                if not auth:
                    return JsonResponse(data={
                        "code": "authorization_header_missing",
                        "description": "Authorization header is expected"},
                        status=401)
                # parts = auth.split()
                # if parts[0].lower() != "bearer":
                #     return JsonResponse(
                #         data={"code": "invalid_header",
                #               "description": "Authorization header must start"
                #                              " with Bearer"}, status=401)
                # elif len(parts) == 1:
                #     return JsonResponse(
                #         data={"code": "invalid_header",
                #               "description": "Token not found"}, status=401)
                # elif len(parts) > 2:
                #     return JsonResponse(data={
                #         "code": "invalid_header",
                #         "description":
                #             "Authorization header must be Bearer token"},
                #         status=401)

                token = auth.split(' ')[1]

                # Confirm A JSON Web Token (JWT) includes three sections
                token_parts = token.split('.')
                if len(token_parts) != 3:
                    return JsonResponse(data={"code": "invalid_header",
                                            "description": "Invalid Token"},
                                        status=401)

                # Match the public Keys
                # jwt_headers = jwt.get_unverified_header(token)
                # kid = jwt_headers["kid"]
                # jwks = json.loads(base64.urlsafe_b64decode(settings.JWKS).decode())
                # for public_key in jwks['keys']:
                #     if kid == public_key["kid"]:
                #         break
                # else:
                #     return JsonResponse(
                #         data={"code": "invalid_header",
                #               "description": "Public Key not found."},
                #         status=401)

                # Decode the token and verify claims
                # exponent = base64_to_long(public_key['e'])
                # modulus = base64_to_long(public_key['n'])
                # numbers = RSAPublicNumbers(exponent, modulus)
                # public_key = numbers.public_key(backend=default_backend())
                # pem = public_key.public_bytes(
                #     encoding=serialization.Encoding.PEM,
                #     format=serialization.PublicFormat.SubjectPublicKeyInfo)

                try:
                #     log.info("Validating Token %s with AUD %s ISS %s " %
                #              (token, settings.AUDIENCE, settings.ISS))
                #     decoded_token = jwt.decode(jwt=token, verify=False)
                    # have commented below till UI is ready with refresh
                    # token changes
                    decoded_token = jwt_decode_handler(token)
                except jwt.ExpiredSignatureError as e:
                    return JsonResponse(data={"code": "invalid_header",
                                            "description": "Token Expired:"
                                                            " %s" % str(e)},
                                        status=401)
            if not request.GET._mutable:
                request.GET._mutable = True
                if bool(decoded_token):
                    request.GET['query'] = decoded_token
                elif userdata:
                    request.GET.update({'query': userdata})
                    #request.GET['query'] = userdata

            # log.info("Token Validated user -  %s, %s - cognito id  %s ." %
            #          (decoded_token['given_name'],
            #           decoded_token['family_name'],
            #           decoded_token['cognito:username']))
            response = self.get_response(request)
            return response

        else:
            response = self.get_response(request)
            return response

