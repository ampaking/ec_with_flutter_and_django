from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response

class ProductView(APIView):
    def get(self, request):
        query = Product.objects.all()
        serializers = ProductSerializer(query, many=True)

        return Response(serializers.data) 
