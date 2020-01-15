from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.urls import reverse

from django.views.decorators.csrf import csrf_exempt

# Create your views here.
@csrf_exempt
def receivePost(request):
    if(request.method=="POST"):
        content = request.read().decode(encoding='UTF-8',errors='strict')
        print(content)
        return HttpResponse(content)
    return HttpResponse("12123")