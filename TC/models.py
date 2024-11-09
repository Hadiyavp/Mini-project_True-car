from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=50)


class category_table(models.Model):
    name=models.CharField(max_length=100)


class bodytype(models.Model):
    name=models.CharField(max_length=100)

class staff_table(models.Model):
    login_ID=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    pin=models.IntegerField()
    post=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    image=models.FileField()
class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    pin=models.IntegerField()
    post=models.CharField(max_length=50)
    phone=models.BigIntegerField()
    image=models.FileField()

class product_table(models.Model):
     name=models.CharField(max_length=100)
     model=models.IntegerField()
     year=models.IntegerField()
     image=models.FileField()
     body_type=models.CharField(max_length=50)
     company=models.CharField(max_length=50)
     details=models.TextField()
     history=models.CharField(max_length=50)
     service=models.TextField()
     warranty=models.CharField(max_length=50)
     color=models.CharField(max_length=50)
     fuel=models.CharField(max_length=50)
     km=models.CharField(max_length=50)
     manul=models.CharField(max_length=50)
     owner=models.CharField(max_length=50)
     battary=models.CharField(max_length=50)
     price=models.IntegerField()


class product_images(models.Model):
    image = models.FileField()
    PRODUCT = models.ForeignKey(product_table, on_delete=models.CASCADE)


class testdrive_booking(models.Model):
    PRODUCT = models.ForeignKey(product_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    date=models.DateField()
    time=models.TimeField()
    status=models.CharField(max_length=20)




class testdrive_booking(models.Model):
    PRODUCT = models.ForeignKey(product_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    date=models.DateField()
    time=models.TimeField()
    status=models.CharField(max_length=20)

class product_booking(models.Model):
    PRODUCT = models.ForeignKey(product_table, on_delete=models.CASCADE)
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=2000)
    reson=models.CharField(max_length=1000,default="na")


class feedback(models.Model):
    USER = models.ForeignKey(user_table, on_delete=models.CASCADE)
    PRODUCT = models.ForeignKey(product_table, on_delete=models.CASCADE)
    feedback=models.CharField(max_length=200)

class complaint(models.Model):
    USER=models.ForeignKey(user_table, on_delete=models.CASCADE)
    comaplaint=models.CharField(max_length=300)
    date=models.DateField()
    reply=models.CharField(max_length=200)