from django.db import models
from django.contrib.auth.models import User

def generate_groupname(self,filename):
    url= "profiles/%s/%s" % (self.group, self.name)
    return url;

class ProfileTemplate(models.Model):
    name = models.CharField(max_length=100)
    config_path=models.FileField(upload_to=generate_groupname )
    parameters=models.TextField()
    status=models.BooleanField(default=True)
    group=models.CharField(max_length=100)
    created_date = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_date = models.DateTimeField(auto_now=True)


class FabricProfile(models.Model):
    name = models.CharField(max_length=100)
    submit = models.CharField(max_length=10, default="false")
    referenced = models.IntegerField(null=True,blank=True,default=0)
    installed =  models.IntegerField(null=True,blank=True,default=0)
    construct_list = models.TextField()
    status = models.BooleanField(default=True)
    last_modified_by = models.ForeignKey(User)
    created_date = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_date = models.DateTimeField(auto_now=True)
    used = models.IntegerField(default = 0)