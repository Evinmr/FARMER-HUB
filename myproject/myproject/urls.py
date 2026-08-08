"""myproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp import views
from . import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index,name='index'),
    path('loginn/',views.loginn,name='loginn'),
    path('buyerregister/',views.buyerregister,name='buyerregister'),
    path('sellerregister/',views.sellerregister,name='sellerregister'),
    path('productdetails/',views.productdetails,name='productdetails'),
    path('addproduct/',views.addproduct,name='addproduct'),
    path('logoutt/',views.logoutt,name='logoutt'),
    path('about/', views.about, name='about'),
    path('galleryyy/', views.galleryyy, name='galleryyy'),
    path('sellerupdate/<int:id>/',views.sellerupdate, name='sellerupdate'),
    path('shopnow/',views.shopnow,name='shopnow'),
    path('viewproduct/<int:id>/',views.viewproduct,name='viewproduct',),
    path('cart/',views.cart,name='cart'),
    path('deletecart/<int:id>/',views.deletecart,name='deletecart'),
    path('checkout/',views.checkout,name='checkout'),
    path('payment_success/<int:id>/',views.payment_success,name='payment_success'),
    path('wishlist/',views.wishlist,name='wishlist'),
    path('add_to_wishlist/<int:id>/',views.add_to_wishlist,name="add_to_wishlist"),
    path('account/',views.account,name='account'),
    path('track_delivery/<int:id>/',views.track_delivery,name='track_delivery'),
    path('deletewishlist/<int:id>/',views.deletewishlist,name='deletewishlist'),
    path('feedback/<int:id>/',views.feedback,name='feedback'),

]+ static(settings.MEDIA_URL,document_root =settings.MEDIA_ROOT)
