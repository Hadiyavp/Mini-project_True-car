import smtplib
from django.core.paginator import Paginator

from datetime import datetime
from email.mime.text import MIMEText

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from TC.models import login_table, staff_table, product_table,user_table,product_images,testdrive_booking,product_booking

from TC.models import *
def index(request):
    product = product_table.objects.all()
    return render(request,"pub.html",{'product':product})
    # return render(request,"main_home.html")
    # return render(request,"login_index.html")

def loginpage(request):
    # return render(request,"lindex.html")
    return render(request,"LOGIN.html")
    return render(request,"LOGIN.html")

def user_reg(request):
    return render(request,"User/userreg.html")

def reg_post(request):
    name=request.POST['name']
    place=request.POST['place']
    pin=request.POST['pin']
    post=request.POST['post']
    phone=request.POST['phone']
    email=request.POST['email']
    password=request.POST['password']
    img=request.FILES['img']


    ob=login_table()
    ob.username=email
    ob.password=password
    ob.type='user'
    ob.save()

    ob1=user_table()
    ob1.LOGIN=ob
    ob1.name=name
    ob1.place=place
    ob1.pin=pin
    ob1.post=post
    ob1.phone=phone
    fn="user.jpg"
    if "img" in request.FILES:
        fs=FileSystemStorage()
        img = request.FILES['img']
        fn=fs.save(img.name,img)
    ob1.image=fn

    ob1.save()
    request.session['lid']=ob.id
    return redirect("/loginpage")




def home(request):
    return render(request,"home.html")

def admin(request):
    ob=staff_table.objects.all()
    obp=product_table.objects.all()
    x=[1,2,3,4,5,6,7,8,9,10,11,12]
    y=[]

    for i in x:
        ob=product_booking.objects.filter(status='booked',date__month=i)
        y.append(len(ob))
    return render(request,"ai.html",{"sc":len(ob),"pc":len(obp),"x":x,"y":y})

def staff(request):
    obp = product_table.objects.all()
    return render(request,'staff/staff.html',{"pc":len(obp)})



def login(request):
    username=request.POST['un']
    password=request.POST['pwd']
    try:
        obj=login_table.objects.get(username=username,password=password)
        request.session['lid'] = obj.id

        # if obj.type == 'admin':
        if obj.type == 'admin':
                return redirect('/admin')
        elif obj.type == 'staff':
                request.session['lid']=obj.id
                return redirect('/staff')
        elif obj.type == 'user':
                return redirect('/user')
        else:
            return redirect('/loginpage')
    except:
            return redirect('/loginpage')

def add_staff(request):
     return render(request,'ADD STAFF-ADMIN.html')

def add_stafff(request):
    name=request.POST['textfield']
    place=request.POST['textfield2']
    pin=request.POST['textfield4']
    post=request.POST['textfield3']
    phone=request.POST['textfield5']
    username=request.POST['username']
    img=request.FILES['img']
    fs=FileSystemStorage()
    fn=fs.save(img.name,img)

    l=login_table()
    l.username=username
    l.password=phone
    l.type='staff'
    l.save()
    login_obj = staff_table()

    login_obj.login_ID=l
    login_obj.name=name
    login_obj.place = place
    login_obj.pin=pin
    login_obj.post=post
    login_obj.phone = phone
    login_obj.image = fn
    login_obj.save()

    return redirect('/manage_staff')

def manage_staff(request):
    obj = staff_table.objects.all().order_by("-id")
    return render(request, 'MANAGE STAFF-ADMIN.html', {'values': obj})

def manage_users(request):
    obj = user_table.objects.all()
    return render(request, 'MANAGE_USER_ADMIN.html', {'values': obj})

def delete(request,id):
    obj=staff_table.objects.get(id=id)
    ob=login_table.objects.get(id=obj.login_ID.id)
    ob.type='blocked'
    ob.save()

    return redirect('/manage_staff')

def un_delete(request,id):
    obj=staff_table.objects.get(id=id)
    ob=login_table.objects.get(id=obj.login_ID.id)
    ob.type='staff'
    ob.save()

    return redirect('/manage_staff')

def user_block(request,id):

    ob=login_table.objects.get(id=id)
    ob.type='blocked'
    ob.save()

    return redirect('/manage_users')

def user_unblock(request,id):

    ob=login_table.objects.get(id=id)
    ob.type='user'
    ob.save()

    return redirect('/manage_users')


def edit_staff(request,id):
    request.session['id'] = id
    obj=staff_table.objects.get(id=id)
    return render(request,'EDIT STAFF-ADMIN.html',{'i':obj})

def edit_stafff(request):
    name = request.POST['textfield']
    pin=request.POST['textfield4']
    post=request.POST['textfield3']
    place=request.POST['textfield2']
    phone=request.POST['textfield5']

    login_obj =staff_table.objects.get(id=request.session['id'])
    if 'img' in request.FILES:
        img=request.FILES['img']
        fs=FileSystemStorage()
        fn=fs.save(img.name,img)
        login_obj.image=fn
    login_obj.name = name
    login_obj.pin=pin
    login_obj.post = post
    login_obj.place = place
    login_obj.phone=phone
    login_obj.save()
    return redirect('/manage_staff')


def add_product(request):
    ob=category_table.objects.all()
    ob1=bodytype.objects.all()
    return render(request,'ADD PRODUCT-ADMIN.html',{"val":ob,"val1":ob1})

def add_productt(request):
    name=request.POST['name']
    model=request.POST['model']
    y=request.POST['year']
    c=request.POST['company']
    pr=request.POST['price']
    hi=request.POST['his']
    ser=request.POST['ser']
    body_type=request.POST['body_type']
    war=request.POST['warranty']
    col=request.POST['color']
    fu=request.POST['fuel']
    km=request.POST['km']
    manu=request.POST['manul']
    owner=request.POST['owner']
    batt=request.POST['Battery']
    des=request.POST['des']
    image=request.FILES['file']
    fs=FileSystemStorage()
    date = datetime.now().strftime("%Y-%m-%d") + ".jpg"
    fs.save(date,image)
    path=date


    login_obj=product_table()
    login_obj.name = name
    login_obj.model = model
    login_obj.year = y
    login_obj.body_type=body_type
    login_obj.image = path
    login_obj.company = c
    login_obj.price=pr
    login_obj.history = hi
    login_obj.service = ser
    login_obj.warranty = war
    login_obj.color = col
    login_obj.fuel = fu
    login_obj.km = km
    login_obj.manul = manu
    login_obj.owner = owner
    login_obj.battary = batt
    login_obj.details = des
    login_obj.outomatic = des
    login_obj.save()
    request.session['pid']=login_obj.id
    return  render(request,"ADD PRODUCT-IMAGE.html")
    return redirect('/manage_product')


def add_productt_img(request):
    img=request.FILES['file']
    ob=product_images()
    ob.PRODUCT=product_table.objects.get(id=request.session['pid'])
    ob.image=img
    ob.save()
    ob=product_images.objects.filter(PRODUCT__id=request.session['pid'])
    return render(request, "ADD PRODUCT-IMAGE.html",{"data":ob})


def manage_product(request):
    obj = product_table.objects.all().order_by("-id")
    paginator = Paginator(obj, 3)  # Show 3 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)

    # Debugging: Print current page number and object count
    print(f"Page number: {page_number}")  # Should show the current page number
    print(f"Total items: {paginator.count}")  # Total number of products
    print(f"Page object: {page_obj}")  # Debugging page object

    return render(request, 'MANAGE PRODUCT-ADMIN.html', {'values': page_obj})


def delete_product(request,id):
    obj=product_table.objects.get(id=id)
    obj.delete()
    return redirect('/manage_product')

def edit_product(request,id):
    obj = product_table.objects.get(id=id)
    return render(request, 'EDIT PRODUCT-ADMIN.html', {'i': obj})

def edit_productt(request):
    id = request.POST['id']
    name = request.POST['name']
    model = request.POST['model']
    y = request.POST['year']
    c = request.POST['company']
    pr = request.POST['price']
    hi = request.POST['his']
    ser = request.POST['ser']
    war = request.POST['warranty']
    col = request.POST['color']
    fu = request.POST['fuel']
    km = request.POST['km']
    manu = request.POST['manul']
    owner = request.POST['owner']
    batt = request.POST['Battery']
    des = request.POST['des']


    login_obj = product_table.objects.get(id=id)
    if 'file' in request.FILES:
        image = request.FILES['file']
        if image != '':
            fs = FileSystemStorage()

            path=fs.save(image.name, image)


            login_obj.image = path

    login_obj.name = name
    login_obj.model = model
    login_obj.year = y
    login_obj.company = c
    login_obj.price = pr
    login_obj.history = hi
    login_obj.service = ser
    login_obj.warranty = war
    login_obj.color = col
    login_obj.fuel = fu
    login_obj.km = km
    login_obj.manul = manu
    login_obj.owner = owner
    login_obj.battary = batt
    login_obj.details = des
    login_obj.outomatic = des
    login_obj.save()

    # name = request.POST['textfield']
    # model = request.POST['textfield2']
    # type = request.POST['textfield4']
    # details = request.POST['textfield5']
    # price=request.POST['textfield6']
    #
    # product = product_table.objects.get(id=id)
    #
    # if 'photoss' in request.FILES:
    #     image = request.POST['new_image']
    #     if image != '':
    #         fs=FileSystemStorage()
    #         date = datetime.now().strftime("%Y-%m-%d") + ".jpg"
    #         fs.save(date, image)
    #         path = date
    #         product.image = path

    # product.name = name
    # product.model = model
    # product.type = type
    # product.details = details
    # product.price=price
    # product.save()
    return redirect('/manage_product')


# def edit_staff_profile(request):
#
#     obj=staff_table.objects.get(login_ID__id=request.session['lid'])
#     return render(request,'staff/view_product.html',{'i':obj})

def edit_staff_profile(request):

    obj=staff_table.objects.get(login_ID__id=request.session['lid'])
    return render(request,'staff/EDIT STAFF.html',{'i':obj})
def edit_staff_profile1(request):

    obj=staff_table.objects.get(login_ID__id=request.session['lid'])
    return render(request,'staff/EDIT STAFF1.html',{'i':obj})

def edit_stafff_profile(request):
    name = request.POST['textfield']
    pin=request.POST['textfield4']
    post=request.POST['textfield3']
    place=request.POST['textfield2']
    phone=request.POST['textfield5']

    login_obj =staff_table.objects.get(login_ID__id=request.session['lid'])
    login_obj.name = name
    login_obj.pin=pin
    login_obj.post = post
    login_obj.place = place
    login_obj.phone=phone
    if "img" in request.FILES:
        img=request.FILES['img']
        fs=FileSystemStorage()
        fn=fs.save(img.name,img)
        login_obj.image=fn
    login_obj.save()
    return redirect('/staff')

def staff_product_view_more(request,id):
    object = product_table.objects.get(id=id)
    return render(request, 'staff/staff_product_view_more.html',{'object':object})

def staff_view_product(request):
    obj = product_table.objects.all()
    paginator = Paginator(obj, 3)  # Show 6 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)
    return render(request, 'staff/view_product.html', {'values': page_obj})

def staff_view_product_search(request):
    s=request.POST['s']
    obj = product_table.objects.filter(name__istartswith=s)
    paginator = Paginator(obj, 3)  # Show 6 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)
    return render(request, 'staff/view_product.html', {'values': page_obj,"s":s})

def admin_view_product_search(request):
    s=request.POST['s']
    obj = product_table.objects.filter(name__istartswith=s)
    paginator = Paginator(obj, 3)  # Show 6 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)
    return render(request, 'MANAGE PRODUCT-ADMIN.html', {'values': page_obj,"s":s})


def admin_staff_search(request):
    s=request.POST['s']
    obj = staff_table.objects.filter(name__istartswith=s).order_by("-id")
    paginator = Paginator(obj, 3)  # Show 6 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)
    return render(request, 'MANAGE STAFF-ADMIN.html', {'values': page_obj,"s":s})




def search_product(request):
    pass


def view_more(request,id):
    object = product_table.objects.get(id=id)
    return render(request, 'staff/product_view_more.html',{'object':object})

def admin_view_more(request,id):
    object = product_table.objects.get(id=id)
    return render(request, 'product_view_more.html',{'object':object})




def user(request):
    query = request.GET.get('search', '')
    model_filter = request.GET.get('model', '')
    color_filter = request.GET.get('color', '')
    bodytype_filter = request.GET.get('bodytype', '')
    fueltype_filter = request.GET.get('fueltype', '')
    price_filter = request.GET.get('price', '')

    print(query)
    print(model_filter)
    print(color_filter)
    print(bodytype_filter)
    print(fueltype_filter)
    print(price_filter)


    plist=[]
    ob=product_booking.objects.exclude(status='Return')
    for i in ob:
        plist.append(i.PRODUCT.id)

    products = product_table.objects.exclude(id__in=plist)
    years = list(range(2013, 2024))  # Creating a list of years from 2013 to 2023

    if query:
        products = products.filter(name__icontains=query)

    if model_filter:
        products = products.filter(model=model_filter)

    if color_filter:
        products = products.filter(color=color_filter)

    if bodytype_filter:
        products = products.filter(body_type=bodytype_filter)

    if fueltype_filter:
        products = products.filter(fuel=fueltype_filter)

    if price_filter:
        price_range = price_filter.split('-')
        products = products.filter(price__gte=price_range[0], price__lte=price_range[1])

    return render(request, 'User/user.html', {
        'product': products,
        'years': years,  # Pass years to the template
    })


def user_view_profile(request):
    user = user_table.objects.get(LOGIN_id=request.session['lid'])
    return render(request, 'User/view_profile.html',{'user':user})

def edit_profile(request):
    profile = user_table.objects.get(LOGIN_id=request.session['lid'])  # Retrieve the user's profile

    if request.method == 'POST':
        # Update profile fields
        profile.name = request.POST['name']
        profile.place = request.POST['place']
        profile.pin = request.POST['pin']
        profile.post = request.POST['post']
        profile.phone = request.POST['phone']

        # Handle image upload
        if 'image' in request.FILES:
            image = request.FILES['image']
            fs = FileSystemStorage()
            # Save the image and update the profile image field
            profile.image = fs.save(image.name, image)

        # Save the updated profile
        profile.save()
        return redirect('/user_view_profile')  # Redirect to the profile view after saving

    return render(request, 'User/edit_profile.html', {'profile': profile})

def product_view_more(request,id):
    request.session['pid']=id

    object = product_table.objects.get(id=id)
    imglist=[{"img":object.image.url}]
    ob=product_images.objects.filter(PRODUCT__id=id)
    for i in ob:
        imglist.append({"img":i.image.url})

    return render(request, 'User/user_view_more.html',{'object':object,"img":imglist})


def view_more_booking(request):
    d=datetime.now().strftime("%Y-%m-%d")
    return render(request,"User/userbooking.html",{"d":d})

def check(request):
    d=request.GET['date']
    t=request.GET['time']
    ob=testdrive_booking.objects.filter(date=d,time__hour=t.split(":")[0])
    print(d,t)
    print(ob)
    if len(ob)>0:
        return JsonResponse({"task":True})
    else:
        return JsonResponse({"task":False})


def booknow_post(request):
    d=request.POST['d']
    t=request.POST['t']
    ob=testdrive_booking()
    ob.PRODUCT = product_table.objects.get(id=request.session['pid'])
    ob.USER = user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.date=d
    ob.time=t
    ob.status='Booked'
    ob.save()
    return render(request, 'User/verification2.html', {'car': ob.PRODUCT,"d":d,"t":t})
    return render(request,'User/verification2.html')



def edit_user_profile(request):
    ob=user_table.objects.get(LOGIN__id=request.session['lid'])
    return  render(request,'User/profile.html',{"i":ob})

def edit_user_profile1(request):
    ob=user_table.objects.get(LOGIN__id=request.session['lid'])
    return  render(request,'User/profile1.html',{"i":ob})

def edit_user_profile_post(request):
    name = request.POST['name']
    place = request.POST['place']
    pin = request.POST['pin']
    post = request.POST['post']
    phone = request.POST['phone']




    ob1 = user_table.objects.get(LOGIN__id=request.session['lid'])

    ob1.name = name
    ob1.place = place
    ob1.pin = pin
    ob1.post = post
    ob1.phone = phone
    fn = "user.jpg"
    if "img" in request.FILES:
        fs = FileSystemStorage()
        img = request.FILES['img']
        fn = fs.save(img.name, img)
    ob1.image = fn

    ob1.save()
    return redirect("/edit_user_profile")

def forgot_password(request):

    return render(request,"fp.html")

def mybooking(request):
    res=product_booking.objects.filter(USER__LOGIN__id=request.session['lid'])

    return render(request,"User/mybooking.html",{"val":res})


def mybooking(request):
    res=product_booking.objects.filter(USER__LOGIN__id=request.session['lid']).order_by("-date")

    return render(request,"User/mybooking.html",{"val":res})


def myTestDrive(request):
    res=testdrive_booking.objects.filter(USER__LOGIN__id=request.session['lid']).order_by("-date")

    return render(request,"User/testDrive.html",{"val":res})

def forgot_password_post(request):
    un=request.POST['un']
    try:
        ob=login_table.objects.get(username=un)

        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('truecarpathanapuram@gmail.com', 'gavm gpgh xkhy pzbs')
            print("login=======")
        except Exception as e:
            print("Couldn't setup email!!" + str(e))
        msg = MIMEText("Your new password is : " + str(ob.password))
        print(msg)
        msg['Subject'] = 'TrueCar'
        msg['To'] = un
        msg['From'] = 'truecarpathanapuram@gmail.com'

        print("ok====")

        try:
            gmail.send_message(msg)
            return HttpResponse('''<script>alert("check your mail");window.location="/loginpage"</script>''')


        except Exception as e:
            return HttpResponse('''<script>alert("Network error");window.location="/forgot_password"</script>''')



    except Exception as e:
        print (e)

        return HttpResponse('''<script>alert("Invalid Username");window.location="/forgot_password"</script>''')

import  razorpay

def user_pay_proceed(request,id):
    request.session['rid'] = id


    request.session['pay_amount'] = "2000"
    client = razorpay.Client(auth=("rzp_test_edrzdb8Gbx5U5M", "XgwjnFvJQNG6cS7Q13aHKDJj"))
    print(client)
    payment = client.order.create({'amount': request.session['pay_amount']+"00", 'currency': "INR", 'payment_capture': '1'})
    res=user_table.objects.get(LOGIN__id=request.session['lid'])



    return render(request,'User/UserPayProceed.html',{'p':payment,'val':res,"lid":request.session['lid'],"id":request.session['rid']})

def on_payment_success(request):
    request.session['rid'] = request.GET['id']
    request.session['lid'] = request.GET['lid']

    event = str(request.body)
    print(event)
    if 'payment_failed' in event:
        return HttpResponse('''
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
                        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                Swal.fire({
                                    icon: 'failed',
                                    title: 'Payment Failed... !',
                                    confirmButtonText: 'OK',
                                    reverseButtons: true
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location = "/user";
                                    }
                                });
                            });
                        </script>
                    ''')
    else:
        ob = product_booking()
        ob.PRODUCT =product_table.objects.get(id=request.session['rid'])
        ob.USER = user_table.objects.get(LOGIN__id=request.session['lid'])
        ob.date=datetime.today()
        ob.status='booked'
        ob.save()
    return HttpResponse('''
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        Swal.fire({
                            icon: 'success',
                            title: 'Booking Confirmed... !',
                            confirmButtonText: 'OK',
                            reverseButtons: true
                        }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "/verification/'''+str(ob.id)+'''";
                            }
                        });
                    });
                </script>
            ''')



def verification(request,id):

    # return render(request, 'MANAGE PRODUCT-ADMIN.html', {'values': page_obj})
    ob=product_booking.objects.get(id=id)
    return render(request,'User/verification.html',{'car':ob.PRODUCT})


def admin_view_booking(request):
    res=testdrive_booking.objects.all()
    paginator = Paginator(res, 3)  # Show 3 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)

    # Debugging: Print current page number and object count
    print(f"Page number: {page_number}")  # Should show the current page number
    print(f"Total items: {paginator.count}")  # Total number of products
    print(f"Page object: {page_obj}")  # Debugging page object

    # return render(request, 'MANAGE PRODUCT-ADMIN.html', {'values': page_obj})
    return render(request,'admin_booking.html',{'values':page_obj})

def admin_view_car_booking(request):
    res=product_booking.objects.filter(status='booked')
    paginator = Paginator(res, 3)  # Show 3 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)

    # Debugging: Print current page number and object count
    print(f"Page number: {page_number}")  # Should show the current page number
    print(f"Total items: {paginator.count}")  # Total number of products
    print(f"Page object: {page_obj}")  # Debugging page object

    # return render(request, 'MANAGE PRODUCT-ADMIN.html', {'values': page_obj})
    # return render(request, 'admin_booking.html', {'values': page_obj})
    return render(request,'admin_booking2.html',{'values':res})

def admin_view_car_booking1(request):
    res=product_booking.objects.exclude(status='booked')
    paginator = Paginator(res, 3)  # Show 3 products per page
    page_number = request.GET.get('page', 1)  # Default to page 1
    page_obj = paginator.get_page(page_number)

    # Debugging: Print current page number and object count
    print(f"Page number: {page_number}")  # Should show the current page number
    print(f"Total items: {paginator.count}")  # Total number of products
    print(f"Page object: {page_obj}")  # Debugging page object

    # return render(request, 'MANAGE PRODUCT-ADMIN.html', {'values': page_obj})
    # return render(request, 'admin_booking.html', {'values': page_obj})
    return render(request,'admin_booking3.html',{'values':res})


def staff_view_car_booking(request):
    res=product_booking.objects.all()
    return render(request,'staff/staff_booking2.html',{'data':res})


def staff_view_test_booking(request):
    res=testdrive_booking.objects.all()
    return render(request,'staff/staff_view_testdrivr__booking.html',{'data':res})

def user_feedbacktemp(request,id):
    request.session["pid"]=id
    return render(request,'User/user_feedback.html')

def user_feedbackPost(request):
    print(request.POST)
    id=request.POST['book_id']
    feedback_content=request.POST["fb"]
    ob=feedback()
    ob.USER=user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.PRODUCT_id= id
    ob.feedback=feedback_content
    ob.save()
    return redirect('/mybooking')
def adminFeedbackView(request):
    ob=feedback.objects.all()
    return render(request,'Admin_viewFeedback.html',{'details':ob})
def user_complaintTemp(request):
    return  render(request,'User/user_complaint.html')

def user_PostComplaint(request):
    ob=complaint()
    ob.comaplaint=request.POST["txtcomplaint"]
    ob.date=datetime.now().today().date()
    ob.reply='pending'
    ob.USER=user_table.objects.get(LOGIN__id=request.session['lid'])
    ob.save()
    return HttpResponse('''<script>alert("Complaint Post successfully");window.location="/user"</script>''')

def user_complaintView(request):
    id = user_table.objects.get(LOGIN__id=request.session['lid'])
    ob=complaint.objects.filter(USER_id=id.id)
    return render(request,'User/user_complaintView.html',{'details':ob})

def adminViewComplaints(request):
    ob=complaint.objects.all()
    return render(request,'adminViewComplaint.html',{'details':ob})
def return_book(request,id):
    request.session['bid']=id
    return render(request,'user/reson.html')
def accept_return(request,id):
    ob=product_booking.objects.get(id=id)
    ob.status='Return'
    ob.save()
    # obp=ob.PRODUCT
    # obp.
    return redirect('/admin_view_car_booking1')
def reject_return(request):
    id=request.POST['book_id']
    reason=request.POST['fb']


    ob=product_booking.objects.get(id=id)
    ob.status='Rejected - '+reason
    ob.save()

    return redirect("/admin_view_car_booking1")


def reason_post(request):
    ob=product_booking.objects.get(id=request.POST['book_id'])
    ob.status='Return Requested'
    ob.reson=request.POST['fb']
    ob.save()
    return redirect("/mybooking")
def send_reply(request):
    r=request.POST['feedback']
    book_id=request.POST['book_id']
    ob=complaint.objects.get(id=book_id)
    ob.reply=r
    ob.save()
    return redirect("/adminViewComplaints")



def admin_add_cat(request):
    if 'submit' in request.POST:
        cat=request.POST['cat']
        c=category_table()
        c.name=cat
        c.save()
        return redirect('/admin_add_cat')
    return render(request,'admin_add_cat.html')


def admin_view_cat(request):
    a=category_table.objects.all()
    return render(request,'admin view cat.html',{'data':a})


def delete_cat(request,id):
    a=category_table.objects.get(id=id)
    a.delete()
    return redirect('/admin_view_cat')



def admin_view_bt(request):
    a=bodytype.objects.all()
    return render(request,'admin viewbt.html',{'data':a})


def delete_bt(request,id):
    a=bodytype.objects.get(id=id)
    a.delete()
    return redirect('/admin_view_bt')

def admin_add_bt(request):
    if 'submit' in request.POST:
        cat=request.POST['cat']
        c=bodytype()
        c.name=cat
        c.save()
        return redirect('/admin_view_bt')
    return render(request,'admin_add_bt.html')

