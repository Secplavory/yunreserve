from django.conf.urls import include, url
from . import views
XMLslot_Patterns = [
    url('', views.receivePost),
]
