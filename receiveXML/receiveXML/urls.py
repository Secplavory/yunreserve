from django.contrib import admin
from django.urls import path
from django.conf.urls import include, url

from XMLslot.urls import XMLslot_Patterns

urlpatterns = [
    url('admin/', admin.site.urls),
    path('',include(XMLslot_Patterns)),
]
