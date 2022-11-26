from django.contrib.auth.models import User, Group
from profileAPI.models import ProfileModel
from rest_framework import viewsets, status
from rest_framework.views import APIView
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from profileAPI.serializer import UserSerializer, RegisterSerializer, GroupSerializer, ProfileSerializer
from rest_framework_simplejwt.tokens import RefreshToken, AccessToken
from rest_framework.response import Response

class RegisterView(CreateAPIView):
    queryset = User.objects.all()
    serializer_class = RegisterSerializer
    permission_classes = [AllowAny]

class LogoutView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            access_token = request.data["access_token"]
            refresh_token = request.data["refresh_token"]
            
            atoken = AccessToken(access_token)
            rtoken = RefreshToken(refresh_token)

            # atoken.
            rtoken.blacklist()
            return Response(status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    #permission_classes = [IsAuthenticated]

class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [IsAuthenticated]

class ProfileViewSet(viewsets.ModelViewSet):
    queryset = ProfileModel.objects.all()
    serializer_class = ProfileSerializer
    permission_classes = [IsAuthenticated]
