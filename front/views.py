from django.core.paginator import Paginator
from django.http import JsonResponse
from front import models
from django.shortcuts import render
import json
def findtrain(request):
    return render(request,'findtrain.html')
def findpost(request):
    if request.method=="GET":
        tdata = request.GET.get("tdata")
        startcity = request.GET.get("startcity")
        arrcity = request.GET.get("arrcity")
        train = models.TrainInfo.objects.filter(tdata=tdata,startCity=startcity,arrCity=arrcity)
        content = {'data': train}
        return render(request, 'findtrain.html', content)
def problem():
    with open(r"./templates/pro.json",) as f:
        data=json.load(f)
        f.close()
    return data
def buy(request,uid,tid):
        print("bbbbbbbbbuuuuuuuuu")
        user=models.User.objects.filter(id=uid).first()
        data=models.TrainInfo.objects.filter(id=tid).first()
        det=int(data.ticketStill)
        tic=int(data.ticketBuy)+1
        de=det-1
        uname = user.uname
        tdata = data.tdata
        tno = data.tno
        startCity = data.startCity
        arrCity = data.arrCity
        startTime = data.startTime
        arrTime = data.arrTime
        seatSum = data.seatSum
        price = data.price
        models.BuyInfo.objects.create(uname = uname,tdata = tdata,  tno = tno,startCity = startCity,arrCity = arrCity,startTime = startTime,arrTime = arrTime,seatSum = seatSum,price = price).save()
        models.TrainInfo.objects.filter(id=tid).update(ticketStill=str(de),ticketBuy=str(tic))
        content={}
        content['id']=uid
        content['uname']=user.uname
        return render(request,'index2.html',content)
def findtrains(request):
    if request.method == 'GET':
        print("11111111111")
        # print("********************")
        tdata = request.GET.get("tdata")
        startcity = request.GET.get("startcity")
        arrcity = request.GET.get("arrcity")
        print(tdata,startcity,arrcity)
        traininfo = models.TrainInfo.objects.all()
        datacount = traininfo.count()
        list = []
        for data in traininfo:
            dict = {}
            dict["tdata"] = data.tdata
            dict["tno"] = data.tno
            dict["startCity"] = data.startCity
            dict["arrCity"] = data.arrCity
            dict["startTime"] = data.startTime
            dict["arrTime"] = data.arrTime
            dict["seatSum"] = data.seatSum
            dict["ticketStill"] = data.ticketStill
            dict["ticketBuy"] = data.ticketBuy
            dict["price"] = data.price
            list.append(dict)
        pageIndex = request.GET.get('pageIndex')
        pageSize = request.GET.get('pageSize')
        pageInator = Paginator(list, pageSize)
        contacts = pageInator.page(pageIndex)
        res = []  # 最终返回的结果集合
        for contact in contacts:
            res.append(contact)
        Result = {"Code": 200, "msg": "success", "count": datacount, "data": res}
        return JsonResponse(Result)
def tankuang(request,num):
    content=problem()
    id=int(num)
    li={}
    li['title']=content['title'][id]
    li['desc']=content['desc'][id]
    return render(request,'tankuang.html',li)
def index(request):
    if request.method == 'GET':
        content = problem()
        print(content)
        list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'k']
        li = {}
        for i in range(0, 12):
            print(i, content["title"][i])
            li[list[i]] = content["title"][i]
        return   render(request,'indexForm.html',li)
    if request.method == 'POST':
        startcity = request.POST.get('startcity')
        arrcity = request.POST.get('arrcity')
        tdata = request.POST.get('tdata')
        print(startcity,arrcity,tdata)
        context = {}
        data = models.TrainInfo.objects.filter(startCity=startcity, arrCity=arrcity, tdata=tdata)
        # data["uid"]='0'
        context["data"]=data
        return render(request,'findtrain.html',context)
        # return HttpResponse(content='find_train.html',content_type='text/html')
def register(request):
    if request.method == 'GET':
        content = problem()
        print(content)
        list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'k']
        li = {}
        for i in range(0, 12):
            print(i, content["title"][i])
            li[list[i]] = content["title"][i]
        return   render(request,'register.html',li)
    if request.method == 'POST':
        print("**********")
        ismanage = request.POST.get('ismanage')
        uname = request.POST.get('uname')
        rname = request.POST.get('rname')
        sex = request.POST.get('sex')
        identity = request.POST.get('identity')
        phone = request.POST.get('phone')
        password = request.POST.get('password')
        try:
            print(ismanage,uname,rname,sex,identity,phone,password)
            user=models.User.objects.filter(uname=uname)
            models.User.objects.create(ismanage=ismanage,uname=uname,rname=rname,sex=sex,identity=identity,phone=phone,password=password).save()
        except Exception:
            print("注册失败，请重新注册！")
            content={}
            content['tip']="注册失败，请重新注册！"
            return render(request,'register.html',content)
        else:
            # if user is None:
                print("注册成功")
                return render(request, 'denglu.html', locals())
            # else:
            #     content = {}
            #     content['tip'] = "用户名重复，请重新注册！"
            #     return render(request, 'register.html', content)
def denglu(request):
    if request.method == 'GET':
        content = problem()
        print(content)
        list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'k']
        li = {}
        for i in range(0, 12):
            print(i, content["title"][i])
            li[list[i]] = content["title"][i]
        return render(request, 'denglu.html',li)
    if request.method == 'POST':
        user = request.POST.get('user')
        passwd = request.POST.get('passwd')
        print(user,passwd)
        user = models.User.objects.filter(uname=user).first()
        context={}
        if user is not None:
            if user.password == passwd:
                if user.ismanage == 'yes':
                    print("yyyyyyyyyy")
                    request.session['uname'] = user.uname
                    context['id']=user.id
                    context['uname'] = user.uname
                    context['rname'] = user.rname
                    context['sex'] = user.sex
                    context['identity'] = user.identity
                    context['phone'] = user.phone
                    return render(request, 'index3.html',context)
                elif user.ismanage == 'no':
                    request.session['uname'] = user.uname
                    context['id'] = user.id
                    context['uname']=user.uname
                    context['rname']=user.rname
                    context['sex']=user.sex
                    context['identity']=user.identity
                    context['phone']=user.phone
                    return render(request, 'index2.html',context)
                else:
                    return render(request, 'denglu.html')
            else:
                return render(request, 'denglu.html')
        else:
            return render(request,'denglu.html')
def index2(request,id):
    if request.method == "GET":
        user=models.User.objects.filter(id=id).first()
        content = problem()
        print(content)
        list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'k']
        li = {}
        for i in range(0, 12):
            print(i, content["title"][i])
            li[list[i]] = content["title"][i]
        li['id']=id
        li['uname']=user.uname
        return render(request, 'index2.html', li)
    if request.method == 'POST':
        startcity = request.POST.get('startcity')
        arrcity = request.POST.get('arrcity')
        tdata = request.POST.get('tdata')
        print(startcity, arrcity, tdata)
        context = {}
        data = models.TrainInfo.objects.filter(startCity=startcity, arrCity=arrcity, tdata=tdata)
        # data["uid"]='0'
        user=models.User.objects.filter(id=id).first()
        context['user']=user
        context["data"] = data
        return render(request, 'find2.html', context)
def information(request,id):
    if request.method == 'GET':
        context={}
        users = models.User.objects.filter(id=id).first()
        if users is not None:
            context['id']=users.id
            context['uname'] = users.uname
            context['rname'] = users.rname
            context['sex'] = users.sex
            context['identity'] = users.identity
            context['phone'] = users.phone
            return render(request, 'information.html',context)
def history(request,id):
    if request.method=="GET":
        con=models.User.objects.filter(id=id).first()
        uname=con.uname
        data = models.BuyInfo.objects.filter(uname=uname)
        content = {'data': data,'id':con.id,'uname':uname}
        return render(request, 'history.html', content);
def index3(request,id):
    if request.method=="GET":
        content = problem()
        print(content)
        list = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'k']
        li = {}
        user=models.User.objects.filter(id=id).first()
        for i in range(0, 12):
            print(i, content["title"][i])
            li[list[i]] = content["title"][i]
        li["uname"]=user.uname
        li["id"]=id
        return render(request,'index3.html',li)
    if request.method == 'POST':
        startcity = request.POST.get('startcity')
        arrcity = request.POST.get('arrcity')
        tdata = request.POST.get('tdata')
        print(startcity, arrcity, tdata)
        context = {}
        data = models.TrainInfo.objects.filter(startCity=startcity, arrCity=arrcity, tdata=tdata)
        # data['uid'] = '1'
        context["data"] = data
        return render(request, 'findtrain.html', context)
def information3(request,id):
    if request.method == 'GET':
        context = {}
        users = models.User.objects.filter(id=id).first()
        if users is not None:
            context['id']=users.id
            context['uname'] = users.uname
            context['rname'] = users.rname
            context['sex'] = users.sex
            context['identity'] = users.identity
            context['phone'] = users.phone
        return render(request,'information3.html',context)
def select_traininfo(request,id):
    tdata = request.GET.get("tdata")
    tno = request.GET.get("tno")
    startcity = request.GET.get("startcity")
    arrcity = request.GET.get("arrcity")
    train = models.TrainInfo.objects.filter(tdata=tdata, tno=tno,startCity=startcity, arrCity=arrcity)
    content = {'data': train}
    content['id']=id
    return render(request, 'trainInformation.html', content)
def select_traininfo2(request,id):
    tdata = request.GET.get("tdata")
    tno = request.GET.get("tno")
    startcity = request.GET.get("startcity")
    arrcity = request.GET.get("arrcity")
    train = models.BuyInfo.objects.filter(tdata=tdata, tno=tno,startCity=startcity, arrCity=arrcity)
    content = {'data': train}
    content['id']=id
    return render(request, 'travellerInformation.html', content)
def deletetrain(request,tid,id):
    models.TrainInfo.objects.filter(id=tid).delete()
    data=models.User.objects.filter(id=id).first()
    content={}
    content['id'] = id
    content['uname'] = data.uname
    return render(request,'trainInformation.html',content)
def addtrain(request,id):
        content={}
        content['id']=id
        return render(request, 'add.html',content)
def trainInformation(request,id):
    if request.method=="GET":
        content={}
        user=models.User.objects.filter(id=id).first()
        data = models.TrainInfo.objects.all()
        content['data'] = data
        content['id']=id
        content['uname']=user.uname
        return render(request, 'trainInformation.html', content)
    if request.method == 'POST':
        tdata = request.POST.get('tdata')
        tno = request.POST.get('tno')
        startCity = request.POST.get('startCity')
        arrCity = request.POST.get('arrCity')
        startTime = request.POST.get('startTime')
        arrTime = request.POST.get('arrTime')
        seatSum = request.POST.get('seatSum')
        ticketStill = request.POST.get('ticketStill')
        ticketBuy = request.POST.get('ticketBuy')
        price = request.POST.get('price')
        print("success")
        models.TrainInfo.objects.create(tdata=tdata,tno =tno ,startCity =startCity ,arrCity = arrCity,startTime = startTime,arrTime = arrTime,seatSum = seatSum,ticketStill = ticketStill,ticketBuy = ticketBuy,price =price ).save()
        print(price)
        content = {}
        user = models.User.objects.filter(id=id).first()
        data = models.TrainInfo.objects.all()
        content['data'] = data
        content['id'] = id
        content['uname'] = user.uname
        return render(request,'trainInformation.html',content)
def updatatrain(request,id,uid):
    if request.method=="GET":
        data=models.TrainInfo.objects.filter(id=id)
        user=models.User.objects.filter(id=uid).first()
        content = {'data': data}
        content['id']=uid
        content['uname']=user.uname
        return render(request,'updata.html',content)
    if request.method=="POST":
        startTime = request.POST.get('startTime')
        arrTime = request.POST.get('arrTime')
        seatSum = request.POST.get('seatSum')
        ticketStill = request.POST.get('ticketStill')
        ticketBuy = request.POST.get('ticketBuy')
        price = request.POST.get('price')
        data=models.TrainInfo.objects.filter(id=id)
        for i in range(len(data)):
            data[i].startTime=startTime
            data[i].arrTime=arrTime
            data[i].seatSum=seatSum
            data[i].ticketStill=ticketStill
            data[i].ticketBuy=ticketBuy
            data[i].price=price
            data[i].save()
            content={}
        user = models.User.objects.filter(id=uid).first()
        content['id'] = uid
        content['uname'] = user.uname
        return render(request,'trainInformation.html',content)
def travellerInformation(request,id):
    if request.method=="GET":
        user=models.User.objects.filter(id=id).first()
        data = models.BuyInfo.objects.all()
        content = {'data': data}
        content['id']=id
        content['uname']=user.uname
        return render(request, 'travellerInformation.html', content)
def count(request,id):
    if request.method=="GET":
        content={}
        user=models.User.objects.filter(id=id).first()
        content['id']=id
        content['uname']=user.uname
        return render(request,'count.html',content)
def other(request,id):
    if request.method == "GET":
        content={}
        user=models.User.objects.filter(id=id).first()
        content['id']=id
        content['uname']=user.uname
        issue=problem()
        content['data']=issue
        return render(request,'other.html',content)
    if request.method =="POST":
        title = request.POST.get("title")
        desc = request.POST.get("desc")
        with open("./templates/pro.json", 'r') as f:
            dict = json.load(f)
            f.close()
        with open("./templates/pro.json", "w") as f1:
            dict["title"].append(title)
            dict["desc"].append(desc)
            json.dump(dict,f1)
            f1.close()
            content={}
            content["id"]=id
            issue = problem()
            content['data'] = issue
    return render(request,"other.html",content)