from pyexpat import model
from rest_framework import viewsets
from todolist.core.models import Todo
from todolist.core.serializers import TodoSerializer


class TodoViewSet(viewsets.ModelViewSet):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer
