from django.db import models
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.conf import settings

# Create your models here.
class Buyerregister(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    name=models.CharField(max_length=100,null=True,blank=True)
    phone=models.BigIntegerField(null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    address=models.CharField(max_length=100,null=True,blank=True)
    password=models.CharField(max_length=100,null=True,blank=True)
    def __str__(self):
        return self.name
    
class Sellerregister(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    
    name=models.CharField(max_length=100, null=True, blank=True)
    email=models.EmailField(null=True, blank=True)
    phone=models.BigIntegerField(null=True, blank=True)
    address=models.CharField(max_length=100, null=True, blank=True)
    password=models.CharField(max_length=8, null=True, blank=True)
    image = models.ImageField(upload_to='media', blank=True, null=True)
    status = models.CharField(
        max_length=10,
        choices=[('Pending', 'Pending'), ('Approved', 'Approved')],
        default='Pending'
    )
    def __str__(self):
        return self.name
    
class Categories(models.Model):
    category=models.CharField(max_length=100 , null=True , blank=True)
    def __str__(self):
        return self.category

class Productdetails(models.Model):
    STATUS_CHOICES=[
        ('Pending','Pending'),
        ('Approved','Approved'),
        ('Rejected','Rejected')
    ]
    seller=models.ForeignKey(Sellerregister,on_delete=models.CASCADE)
    product_name=models.CharField(max_length=100 , null=True, blank=True)
    product_description=models.CharField(max_length=2000 , null=True, blank=True)
    category=models.ForeignKey(Categories, on_delete=models.CASCADE)
    price=models.BigIntegerField(null=True, blank=True)
    quantity=models.IntegerField(null=True, blank=True)
    image=models.ImageField(upload_to='media', null=True, blank=True)
    status=models.CharField(max_length=50,choices=STATUS_CHOICES,default='Pending')
    # created_at = models.DateTimeField(auto_now_add=True)
    # is_top_featured = models.BooleanField(default=False) 

    def __str__(self):
        return self.product_name
    

class Cart(models.Model):
    product = models.ForeignKey(Productdetails, on_delete=models.CASCADE, null=True, blank=True)
    buyer=models.ForeignKey(Buyerregister,on_delete=models.CASCADE)
    seller=models.ForeignKey(Sellerregister,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    total_amount=models.FloatField()
    def _str_(self):
        return self.product.product_name
    class Meta:
        unique_together = ('product', 'buyer')


class Booking(models.Model):
    STATUS_CHOICES=[
        ('Pending','Pending'),
        ('Paid','Paid'),
        ('Cancel','Cancel')
    ] 
    delivery_choices=[
        ('Confirmed','Confirmed'),
        ('Shipped','Shipped'),
        ('Out For Delivery','Out For Delivery'),
        ('Delivered','Delivered')
    ]
    buyer=models.ForeignKey(Buyerregister,on_delete=models.CASCADE)
    seller=models.ForeignKey(Sellerregister,on_delete=models.CASCADE)
    product=models.ForeignKey(Productdetails,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    amount=models.FloatField()
    status=models.CharField(max_length=50,choices=STATUS_CHOICES,default='Pending') 
    delivery_status = models.CharField(max_length=100,choices=delivery_choices,default='Confirmed')  
    def _str_(self):
        return self.buyer.user.first_name
    
      
    def save(self,*args,**kwargs):
        if self.pk:
            old=Booking.objects.get(pk=self.pk)
            if old.delivery_status!=self.delivery_status:
                send_mail("delivery stated changed",f"dear{self.buyer.user.first_name},Your product {self.delivery_status}",settings.EMAIL_HOST_USER,[self.buyer.email])
        super().save(*args, **kwargs)


class Personaldetails(models.Model):
    buyer=models.ForeignKey(Buyerregister,on_delete=models.CASCADE)
    seller=models.ForeignKey(Sellerregister,on_delete=models.CASCADE)
    product=models.ForeignKey(Productdetails,on_delete=models.CASCADE)
    quantity=models.IntegerField()
    firstname=models.CharField(max_length=100)
    lastname=models.CharField(max_length=100)
    email=models.EmailField()
    address=models.TextField()
    country=models.CharField(max_length=100)
    state=models.CharField(max_length=100)
    pin=models.IntegerField()
    amount=models.FloatField()
    def _str_(self):
        return self.buyer.user.first_name
    
class Wishlist(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Productdetails, on_delete=models.CASCADE)

    def _str_(self):
        return f"{self.user.username} - {self.product.name}"
    
class Feedback(models.Model):
    product = models.ForeignKey(Productdetails, on_delete=models.CASCADE)
    buyer = models.ForeignKey(Buyerregister, on_delete=models.CASCADE)
    comment = models.TextField()
    rating = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __(self):
        return self.buyer.user.first_name