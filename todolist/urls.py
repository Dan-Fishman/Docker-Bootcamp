from django.urls import include, re_path
from rest_framework import routers

from todolist.core.views import TodoViewSet

router = routers.DefaultRouter()

router.register(r"todos", TodoViewSet)

urlpatterns = [
    re_path(r"^api/", include(router.urls)),
]
