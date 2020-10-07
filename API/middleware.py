from django.conf import settings
from django.http.response import JsonResponse
from rest_framework import status
import json
import jwt
import os
import requests
 

class interceptorMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response
        # self.default_database = settings.DATABASES['default']
        # One-time configuration and initialization.

    def __call__(self,request):
        request_url = request.build_absolute_uri()
        if 'admin' not in request_url:
            if 'signup' not in request_url:
                if 'login' not in request_url:
                    token = request.META.get('HTTP_AUTHORIZATION').split(' ')[1]

                    # make the request object mutable
                    # However if future versions the _mutable can be removed.
                    # Another approach is to use request.data.copy()
                    if not request.GET._mutable:
                        request.GET._mutable = True

                    # decode the token
                    decode_token = jwt.decode(token, None, None)

                    # assign the query key to the decoded token
                    request.GET['query'] = decode_token

                    #if "institute_id" in decode_token.keys():
                    #    os.environ["SAAS_KEY"] = str(decode_token['institute_id'])
        
        # return response
        response = self.get_response(request)
        return response

class tokenValidationMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        request_url = request.build_absolute_uri()
        if 'admin' not in request_url :
            if 'signup' not in request_url:
                if 'login' not in request_url:
                    auth = request.META.get('HTTP_AUTHORIZATION')
                    if not auth:
                        return JsonResponse(data={"code": "authorization_header_missing",
                                                "description":
                                                    "Authorization header is expected"}, status=401)
                    parts = auth.split()
                    if parts[0].lower() != "bearer":
                        return JsonResponse(data={"code": "invalid_header",
                                                "description":
                                                    "Authorization header must start with"
                                                    "Bearer"}, status=401)
                    elif len(parts) == 1:
                        return JsonResponse(data={"code": "invalid_header",
                                                "description": "Token not found"}, status=401)
                    elif len(parts) > 2:
                        return JsonResponse(data={"code": "invalid_header",
                                                "description": "Authorization header must be"
                                                                "Bearer token"}, status=401)
                    token = parts[1]
                    requestBody = {'token': token}
                    
                    # user_details = jwt.decode(token, None, None)
                    # import pdb; pdb.set_trace()
                    resAccount = requests.post(os.environ["TOKEN_VALIDATION_URL"], data=requestBody)
                    if resAccount.status_code == 200:
                        # if request.method == 'GET':
                        response = self.get_response(request)
                    else:
                        return JsonResponse(data={"code": "invalid_header",
                                                "description": "Authorization token invalid"}, status=401)
                    return response
                else:
                    response = self.get_response(request)
                    return response
            else:
                response = self.get_response(request)
                return response
        else:
            response = self.get_response(request)
            return response

