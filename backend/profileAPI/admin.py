from django.contrib import admin
from rest_framework.authtoken.admin import TokenAdmin
from .models import ProfileModel

TokenAdmin.raw_id_fields = ['user']

admin.site.register(ProfileModel)
