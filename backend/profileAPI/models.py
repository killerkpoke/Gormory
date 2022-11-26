from django.db import models

class TimeStampedModel(models.Model): 
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True) 

    class Meta:
        abstract = True

class ProfileModel(TimeStampedModel):
    name = models.CharField(max_length = 50)
    description = models.TextField()
    
    class Meta:
        db_table = "profile"
