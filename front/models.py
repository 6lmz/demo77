from django.db import models

# Create your models here.
class User(models.Model):
    id = models.AutoField(primary_key=True)
    ismanage = models.CharField(max_length=100)
    uname = models.CharField(max_length=100)
    rname = models.CharField(max_length=100)
    sex = models.CharField(max_length=20)
    identity = models.CharField(max_length=100)
    phone = models.CharField(max_length=100)
    password = models.CharField(max_length=100)

class TrainInfo(models.Model):
        id = models.AutoField(primary_key=True)
        tdata = models.CharField(max_length=100)
        tno = models.CharField(max_length=100)
        startCity = models.CharField(max_length=100)
        arrCity = models.CharField(max_length=100)
        startTime = models.CharField(max_length=100)
        arrTime = models.CharField(max_length=100)
        seatSum = models.BigIntegerField()
        ticketStill = models.BigIntegerField()
        ticketBuy = models.BigIntegerField()
        price = models.BigIntegerField()
class BuyInfo(models.Model):
        id = models.AutoField(primary_key=True)
        uname = models.CharField(max_length=100)
        tdata = models.CharField(max_length=100)
        tno = models.CharField(max_length=100)
        startCity = models.CharField(max_length=100)
        startTime = models.CharField(max_length=100)
        arrCity = models.CharField(max_length=100)
        arrTime = models.CharField(max_length=100)
        seatSum = models.BigIntegerField()
        price = models.BigIntegerField()