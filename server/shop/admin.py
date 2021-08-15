from django.contrib import admin
from .models import Cart,Category,CartProduct,Product,Favorite,Order

# Register your models here.
admin.site.register([Cart,Category,CartProduct,Product,Favorite,Order,])
