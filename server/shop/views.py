from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

class ProductView(APIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]
    def get(self, request):

        query = Product.objects.all()
        data = []
        serializers = ProductSerializer(query, many=True)
        for product in serializers.data:
            fab_query = Favorite.objects.filter(user=request.user).filter(
                product_id = product['id']
            )
            if fab_query:
                product['favorite'] = fab_query[0].isFavorite
            else:
                product['favorite'] = False
            data.append(product)        

        return Response(data) 
 