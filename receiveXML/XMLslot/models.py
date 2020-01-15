from django.db import models

# Create your models here.
class testing(models.Model):
    name = ""
    def __str__(self):
        return self.name