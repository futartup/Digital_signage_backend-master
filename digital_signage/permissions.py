from rest_framework.permissions import BasePermission, SAFE_METHODS
# from .utilities import checkIfAdminUser

class NoAuthGetPermission(BasePermission):

    def has_permission(self, request, view):

        if request.method in SAFE_METHODS:
            return True
        else:
            return request.user and request.user.is_authenticated

class PostOnlyPermission(BasePermission):

    def has_permission(self, request, view):
        if request.method == 'POST':
            return True
        else:
            return request.user and request.user.is_authenticated

class WriteOnlyPermission(BasePermission):

    def has_permission(self, request, view):
        if request.method in ['POST', 'PATCH', 'PUT']:
            return True
        else:
            return request.user and request.user.is_authenticated
            return request.user and request.user.is_authenticated

class ReadOnlyPermission(BasePermission):
    def has_permission(self, request, view):
        if request.method == 'GET':
            return True
        else:
            return False

class IsAdminUserPermission(BasePermission):
    def has_permission(self, request, view):
        adminUserUUID = checkIfAdminUser()
        if request.user and request.user.is_authenticated and adminUserUUID == str(request.user.account_type_uuid):
            return True
        else:
            return False
# class IsAdminUserWithGetPermission(BasePermission):
#     def has_permission(self, request, view):
#         if request.user and request.user.is_authenticated:
#             if request.method == 'GET':
#                 return True
#             else:
#                 adminUserUUID = checkIfAdminUser()
#                 if adminUserUUID == str(request.user.account_type_uuid):
#                     return True
#                 else:
#                     return False
#         else:
#             return False

class GpsOnlyOperation(BasePermission):
    def has_permission(self, request, view):
        decoded_token = request.GET
        if 'query' in decoded_token and 'custom:user_portal' in decoded_token['query'] and decoded_token['query']['custom:user_portal'].lower() == 'gps'\
            and 'custom:UserType' in decoded_token['query'] and decoded_token['query']['custom:UserType'].lower() == 'student':
            return True
        return False


class SRMOnlyOperation(BasePermission):
    def has_permission(self, request, view):
        decoded_token = request.GET
        if 'query' in decoded_token and 'custom:user_portal' in decoded_token['query'] and decoded_token['query']['custom:user_portal'].lower() == 'srm'\
            and 'custom:UserType' in decoded_token['query']:
            return True
        return False
