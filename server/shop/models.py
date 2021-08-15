from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Category(models.Model):
    category_name = models.CharField( max_length=200, unique=True)
    create_date = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.category_name

class Product (models.Model):
    title = models.CharField( max_length=100)
    date = models.DateTimeField(auto_now_add=True)
    category = models.ForeignKey(Category,on_delete=models.CASCADE) 
    product_photo = models.ImageField(upload_to='products/')
    original_price = models.PositiveIntegerField()
    discount_price = models.PositiveIntegerField()
    description = models.TextField()

    def __str__(self):
        return self.title

class Favorite(models.Model):
    product = models.ForeignKey(Product,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    isFavorite = models.BooleanField(default=False)
    def __str__(self):
        return f'productID = {self.product.id} user = {self.user.id} isFavorite = {self.isFavorite}'


class Cart(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    total = models.PositiveIntegerField()
    isComplete = models.BooleanField(default=False)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'User = {self.user.username} isComplete = {self.isComplete}'


class CartProduct(models.Model):
    cart = models.ForeignKey(Cart,on_delete=models.CASCADE)
    product = models.ManyToManyField(Product)
    price = models.PositiveIntegerField()
    quantity = models.PositiveIntegerField()
    subtotal = models.PositiveIntegerField()
    def __str__(self):
        return f'Cart = {self.cart.id} | CartProduct = {self.id} | Quantity {self.quantity}'        

class Order(models.Model):
    cart = models.OneToOneField(Cart,on_delete=models.CASCADE)
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    address = models.CharField(max_length=255)
    

