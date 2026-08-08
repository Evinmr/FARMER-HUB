from django.shortcuts import render,redirect
from django.contrib .auth.models import User
from.models import*
from django.contrib import messages
from django.contrib .auth import authenticate,login,logout
from django.http import JsonResponse
import razorpay
client = razorpay.Client(auth=("rzp_test_fCVgGqgcfDm0Lh", "oRfjzp64mC7AOuS2XRL5VeaT"))

# Create your views here.
def index(request):
    cat=Categories.objects.all()
    products=Productdetails.objects.filter(status='Approved')
    if request.user.is_authenticated:
        if Sellerregister.objects.filter(user=request.user).exists():
            seller=Sellerregister.objects.get(user=request.user)
            products=Productdetails.objects.filter(seller=seller,status='Approved')
            return render(request,"index.html",{'cat':cat,'pro':products,'seller':seller})
        if Buyerregister.objects.filter(user=request.user).exists():
            buyer=Buyerregister.objects.get(user=request.user)
            return render(request,'index.html',{'buyer':buyer,'cat':cat,'pro':products})
    return render(request,'index.html',{'cat':cat,'pro':products})

def loginn(request):
    if request.method=='POST':
        username=request.POST.get('name')
        password=request.POST.get('password')
        user=authenticate(request,username=username,password=password)
        if user is not None:
            if Sellerregister.objects.filter(user=user).exists():
                status=Sellerregister.objects.get(user=user).status
                if status == "Approved":
                    login(request,user)
                    messages.success(request,'Welcome')
                    return redirect('index')
                else:
                    messages.info(request,'wait for admin approval')
                    return redirect('loginn')
            login(request,user)
            messages.success(request,'Welcome')
            return redirect('index')
        else:
            messages.info(request,'User invalid')
            return redirect('loginn')
        
    return render(request,'login.html')

def buyerregister(request):
    if request.method=='POST':
        name=request.POST.get('name')
        phone=request.POST.get('phone')
        email=request.POST.get('email')
        address=request.POST.get('address')
        password=request.POST.get('password')
        repassword=request.POST.get('Repassword')
        if User.objects.filter(username=email).exists():
            messages.info(request,"user already exists")
            return redirect('buyerregister')
        if password==repassword:
            user=User.objects.create_user(username=email,first_name=name,email=email,password=password)
            user.save()
            reg=Buyerregister.objects.create(user=user,name=name,phone=phone,email=email,address=address,password=password)
            reg.save()
            messages.info(request,"Successfull")
            return redirect('loginn')
        messages.info(request,"Password Mismatch")
        return redirect('buyerregister')
    return render(request,'buyerregister.html')
    
   

def sellerregister(request):
    if request.method=='POST':
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        address=request.POST.get('address')
        password=request.POST.get('password')
        repassword=request.POST.get('repassword')
        if User.objects.filter(username=email).exists():
           messages.info(request,"user already exists")
           return redirect('sellerregister')
        if password==repassword:
           user=User.objects.create_user(username=email,first_name=name,email=email,password=password)
           user.save()
           reg=Sellerregister.objects.create(user=user,name=name,email=email,phone=phone,address=address,password=password)
           reg.save()
           messages.info(request,"Successfull")
           return redirect('loginn')
        messages.info(request,"Password Mismatch")
        return redirect('sellerregister')
    return render(request,'sellerregister.html')


def productdetails(request):
    if request.method=="POST":
       name=request.POST.get('product_name')
       description=request.POST.get('product_description')
       category=request.POST.get('Category')
       price=request.POST.get('Price')
       quantity=request.POST.get('Quantity')
       image=request.FILES.get('Image')
       
       pro=Productdetails.objects.create(seller=Sellerregister.objects.get(user=request.user),productname=name,description=description,category=Categories.objects.get(category=category),price=price,quantity=quantity,image=image)
       pro.save()
       messages.info(request,'ADDED SUCCESFULLY')
       return redirect('index')
    

def addproduct(request):
    if request.method=="POST":
        name=request.POST.get('pname')
        des=request.POST.get('pdescription')
        cat=request.POST.get('category')
        price=request.POST.get('price')
        quantity=request.POST.get('quantity')
        image=request.FILES.get('image')
        pro=Productdetails.objects.create(seller=Sellerregister.objects.get(user=request.user),product_name=name,product_description=des,category=Categories.objects.get(category=cat),price=price,quantity=quantity,image=image)
        pro.save()
        messages.info(request,'ADDED SUCCESFULLY')    
    return redirect('index')

def sellerupdate(request, id):
    ed=Productdetails.objects.get(id=id)
    if request.method=='POST':
        ed.product_name=request.POST.get('product_name')
        ed.product_description=request.POST.get('product_description')
        ed.price=request.POST.get('price')
        ed.quantity=request.POST.get('quantity')
        if 'image' in request.FILES:
            ed.image = request.FILES['image']
        ed.save()
        return redirect('index')
    return render(request,'sellerupdate.html',{'e':ed})


def logoutt(request):
    logout(request)
    return redirect('index')


def about(request):
    return render(request,'about.html')

def galleryyy(request):
    return render(request,'galleryyy.html')

def shopnow(request):
    products = Productdetails.objects.filter(status='Approved')
    category = Categories.objects.all()
    if request.method=="POST":
        search=request.POST.get('search')
        if Productdetails.objects.filter(product_name=search.title(),status='Approved').exists():
            search_item=Productdetails.objects.filter(product_name=search.title(),status='Approved')
        elif Categories.objects.filter(category_name=search.title()).exists():
            search_item=Productdetails.objects.filter(category_name=Categories.objects.get(category_name=search.title()),status='Approved')
        else:
            messages.warning(request,"Item Not Found!")
            return redirect('shopnow')
        return render(request,"shopnow.html",{"products":products,"category":category,"search_item":search_item})
    return render(request,"shopnow.html",{"products":products,"category":category})

def cart(request):
    cart=Cart.objects.filter(buyer=Buyerregister.objects.get(user=request.user))
    subtotal = 0
    for item in cart:
        subtotal += item.total_amount 
    return render(request,'cart.html',{'cart':cart,'subtotal':subtotal})

def viewproduct(request, id):
    product = Productdetails.objects.get(id=id)
    feed=Feedback.objects.filter(product=product)
    
    if request.method == 'POST':
        if request.user.is_authenticated:

            quantity = int(request.POST.get('quantity'))
            buyer = Buyerregister.objects.get(user=request.user)
            # Check if the product is already in the cart
            cart = Cart.objects.filter(product=product, buyer=buyer).first()
            if cart:
                # Update existing cart item
                cart.quantity += quantity
                cart.total_amount = cart.quantity * product.price
                cart.save()
            else:
                # Create new cart item
                Cart.objects.create(
                    product=product,
                    buyer=buyer,
                    seller=product.seller,
                    quantity=quantity,
                    total_amount=quantity * product.price
                )
            return redirect('cart')
        return redirect('loginn')
    return render(request, 'viewproduct.html', {'product': product,'feeds':feed})

def deletecart(request,id):
    cart=Cart.objects.get(id=id)
    cart.product.quantity+=int(cart.quantity)
    cart.product.save()
    cart.delete()
    return redirect('cart')

def checkout(request):
    if request.user.is_authenticated:
        buyer=Buyerregister.objects.get(user=request.user)
        cart=Cart.objects.filter(buyer=buyer)
        total_price=sum(item.total_amount for item in cart)
        if not Booking.objects.filter(buyer=buyer).exists():
            off='offer'
            offerprice=total_price-(total_price*(20/100))
        else:
            off= None
            offerprice=total_price
        if request.method=='POST':
            fname=request.POST.get('fname')
            lname=request.POST.get('lname')
            email=request.POST.get('email')
            address=request.POST.get('aname')
            country=request.POST.get('cname')
            state=request.POST.get('sname')
            pin=request.POST.get('zip')
            for i in cart:
                personal=Personaldetails.objects.create(buyer=buyer,seller=i.seller,product=i.product,quantity=i.quantity,firstname=fname,lastname=lname,email=email,address=address,country=country,state=state,pin=pin,amount=i.total_amount)
                personal.save()
            DATA = {
            "amount": float(offerprice) * 100,  # Convert to paise
            "currency": "INR",
            "receipt": f"receipt_{request.user.id}",
            "notes": {"key1": "value3", "key2": "value2", "payment_capture": "1"}
            }
            razorpay_order = client.order.create(data=DATA)
            order_id = razorpay_order['id']
            return JsonResponse({'order_id': order_id, 'status': 'order created', 'price': offerprice})
        return render(request,'checkout.html',{'cart':cart,'total_price':total_price,'off':off,'offer_price':offerprice})


from django.views.decorators.csrf import csrf_exempt
from django.core.mail import send_mail
from django.conf import settings
@csrf_exempt

def payment_success(request,id):
    if request.method == "POST":
        try :
            buyer = Buyerregister.objects.get(user=User.objects.get(id=id))
            cart_items=Cart.objects.filter(buyer=buyer)
            for i in cart_items :
                book=Booking.objects.create(buyer=buyer,seller=i.seller,product=i.product,quantity=i.quantity,amount=i.total_amount,status='Paid',delivery_status='Confirmed')
                book.save()
            for item in cart_items :
                item.product.quantity-=item.quantity
                item.product.save()
            try:
                html_message = f"""
                <html>
                  <head>
                    <style>
                      body {{
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        color: #333;
                        padding: 20px;
                      }}
                      .container {{
                        width: 80%;
                        margin: auto;
                        background-color: #fff;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                      }}
                      h2 {{
                        color: #4CAF50;
                      }}
                      table {{
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                      }}
                      th, td {{
                        padding: 12px;
                        border: 1px solid #ddd;
                        text-align: left;
                      }}
                      th {{
                        background-color: #f2f2f2;
                      }}
                      .total {{
                        font-size: 1.2em;
                        font-weight: bold;
                        color: #4CAF50;
                      }}
                      .footer {{
                        margin-top: 20px;
                        text-align: center;
                        font-size: 0.9em;
                        color: #999;
                      }}
                    </style>
                  </head>
                  <body>
                    <div class="container">
                      <h2>Farmershub Booking Confirmation</h2>
                      <p>Dear {request.user.first_name} {request.user.last_name},</p>
                      <p>Thank you for your order! Your booking has been successfully processed. Below are the details of your booking:</p>

                      <h3>Booking Details</h3>
                      <table>
                        <tr><th>Buyer Name</th><td>{buyer.name}</td></tr>
                        <tr><th>Email</th><td>{buyer.email}</td></tr>
                      </table>

                      <h3>Ordered Products</h3>
                      <table>
                        <tr><th>Product Name</th><th>Quantity</th><th>Total Amount</th></tr>
                        {''.join([f'<tr><td>{item.product.productname}</td><td>{item.quantity}</td><td>${item.totalamount}</td></tr>' for item in cart_items])}
                      </table>


                      <div class="footer">
                        <p>Thank you for choosing Farmershub. If you have any questions or need assistance, feel free to contact us.</p>
                      </div>
                    </div>
                  </body>
                </html>
                """

                send_mail(
                    subject='Farmerhub Booking Confirmation',
                    message='Thank you for your order.',
                    from_email=settings.EMAIL_HOST_USER,
                    recipient_list=[request.user.email],
                    html_message=html_message,
                    fail_silently=False
                )

            except Exception as email_error:
                print("Email error:", email_error)

            cart_items.delete()  # Empty the cart regardless of email success
            return JsonResponse({'status': 'success'})

        except Exception as main_error:
            print("Main error:", main_error)
            return JsonResponse({'status': 'error', 'message': str(main_error)})

    return JsonResponse({'status': 'error', 'message': 'Invalid request method'})

def add_to_wishlist(request,id):
    if not request.user.is_authenticated:
        return redirect('loginn')

    product = Productdetails.objects.get (id=id)

    Wishlist.objects.get_or_create(
        user=request.user,
        product=product
    )
    messages.success(request, "Product added to wishlist.")
    return redirect('wishlist')

def wishlist(request):
    if not request.user.is_authenticated:
        return redirect('loginn')
    if not Buyerregister.objects.filter(user=request.user).exists():
        return redirect('index')  
    buyer = Buyerregister.objects.get(user=request.user)
    wishlist_items = Wishlist.objects.filter(user=request.user)
    return render(request, 'wishlist.html', {
        'buyer': buyer,
        'wishlist_items': wishlist_items,
    })


def account(request):
    if  Buyerregister.objects.filter(user=request.user).exists():
        buyer=Buyerregister.objects.get(user=request.user)
        bookings=Booking.objects.filter(buyer=buyer)
        role="buyer"
    elif Sellerregister.objects.filter(user=request.user).exists():
        seller=Sellerregister.objects.get(user=request.user)
        bookings=Booking.objects.filter(seller=seller)
        role='seller'
    return render(request,'account.html',{'role':role,'bookings':bookings})


def track_delivery(request,id):
    book=Booking.objects.get(id=id)
    return render(request,'track_delivery.html',{'book':book})


def deletewishlist(request,id):
    wish=Wishlist.objects.get(id=id)
    wish.delete()
    return redirect('wishlist')

def feedback(request ,id):
    product = Productdetails.objects.get(id=id)

    if request.method == 'POST':
        buyer = Buyerregister.objects.get(user=request.user)
        comment=request.POST.get('comment')
        rating=request.POST.get('rating')
        feed=Feedback.objects.create(product=product,buyer=buyer,comment=comment,rating=rating)
        
        messages.success(request,'Feedback Submitted successfully.')
        return redirect('viewproduct',product.id)
      
    return render(request,'feedback.html',{'product':product,})