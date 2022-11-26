import graphene
from graphene_django import DjangoObjectType
from profileAPI.models import ProfileModel

class ProfileType(DjangoObjectType):
    class Meta:
        model = ProfileModel
        fields = ('id', 'name', 'description', 'created_at', 'modified_at')

class Query(graphene.ObjectType):
    all_profiles = graphene.List(ProfileType)

    def resolve_all_profiles(root, info):
        return ProfileModel.objects.all()

schema =  graphene.Schema(query=Query)