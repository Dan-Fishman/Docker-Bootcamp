from dataclasses import fields
from rest_framework import serializers
from todolist.core.models import Todo


class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todo
        fields = ["id", "name", "description"]
