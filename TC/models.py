from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=50)

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
     details=models.CharField(max_length=50)
     history=models.CharField(max_length=50)
     service=models.CharField(max_length=50)
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