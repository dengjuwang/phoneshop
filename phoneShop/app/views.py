import os

from django.shortcuts import render, redirect
from app import models
import time
from django.contrib import messages



# 添加用户
def reg(request):
    if request.method == 'POST':
        # post请求
        # 获取用户提交的数据
        username = request.POST.get('username')
        password = request.POST.get('password')
        address = request.POST.get('address')
        name = request.POST.get('name')
        sex = request.POST.get('sex')
        email = request.POST.get('email')
        zip = request.POST.get('zip')
        phone = request.POST.get('phone')
        # print(username)
        if models.userinfo.objects.filter(user_name=username):
            # 数据库中有重复的名字
            return render(request, 'reg.html', {'error': '用户名已存在，请重新注册！'})
        # 将数据新增到数据库中
        models.userinfo.objects.create(user_name=username, user_pwd=password, user_addr=address, user_sex=sex,
                                       user_turename=name, user_email=email, user_zip=zip, user_phone=phone)
        # 返回一个重定向到战术出版社的页面
        return redirect('/login/')
    # get请求返回一个页面，页面包含form表单
    return render(request, 'reg.html')

# 登陆
def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        # print(username, password)
        if username == "" or password == "":
            return render(request, 'login.html', {"error": "账号或密码不能为空，请重新登陆！"})
        if models.userinfo.objects.filter(user_name=username):
            user = models.userinfo.objects.get(pk=username)
            if password == user.user_pwd:
                request.session['username'] = username
                return redirect("/index")
            else:
                return render(request, 'login.html', {"error": "密码错误，请重新登陆！"})
        else:
            return render(request, 'login.html', {'error': '账号不存在，请重新登陆！'})
    return render(request, 'login.html')
#退出登陆
def quit(request):
    request.session.clear()
    return redirect("/login/")
#进入主页面
def index(requests):
    all_mi = models.product.objects.filter(pro_type=3)
    all_mi=all_mi[:8]
    all_huawei=models.product.objects.filter(pro_type=2)[:10]
    all_oppo=models.product.objects.filter(pro_type=4)[:10]
    username=requests.session.get("username")
    if requests.method == 'POST':
        phone= requests.POST.get('phone')
        phone_data=models.product.objects.filter(pro_name__contains=phone)
        Error=""
        if bool(phone_data)==False:
            Error="未查询到结果"
        return render(requests,"search.html",{"username":username,"phone_data":phone_data,"error":Error})
    return render(requests, 'index.html', {"all_mi": all_mi,"all_huawei":all_huawei,"all_oppo":all_oppo,"username":username})
def chose(request):
    username = request.session.get("username")
    pk = request.GET.get('pk')
    phone_data = models.product.objects.filter(pro_type=pk)
    return render(request, "search.html", {"username": username, "phone_data": phone_data})


#进入商品详情页
def good(request):
    pk = request.GET.get('pk')
    product=models.product.objects.filter(pk=pk)
    username=request.session.get("username")
    for i in product:
        product=i
    if request.method == 'POST':
        phone= request.POST.get('phone')
        phone_data=models.product.objects.filter(pro_name__contains=phone)
        Error=""
        if bool(phone_data)==False:
            Error="未查询到结果"
        return render(request,"search.html",{"username":username,"phone_data":phone_data,"error":Error})
    return render(request,"good.html",{"product":product,"username":username})
#加入购物车
def goshopcar(request):
    username = request.session.get("username")
    pk = request.GET.get('pk')
    localtime = time.localtime(time.time())
    models.favorite.objects.create(fav_time=localtime,fav_pro_id=pk,user_name_id=username)
    return redirect("/shopcar/")
#进入购物车界面
def shopcar(request):
    username = request.session.get("username")
    favorite_data=models.favorite.objects.filter(user_name_id=username)
    product_data=[]
    for i in favorite_data:
        product_data.append(i.fav_pro)
    sum=0
    for i in product_data:
        sum+=i.pro_price
    return render(request,"shopcar.html",{"product":product_data,"all_price":sum})
#删除购物车商品
def delfav(request):
    pk = request.GET.get('pk')
    models.favorite.objects.filter(fav_pro_id=pk).delete()
    return redirect("/shopcar/")
#结算订单
def result(request):
    username = request.session.get("username")
    favorite_data=models.favorite.objects.filter(user_name_id=username)
    localtime = time.localtime(time.time())
    for i in favorite_data:
        models.order.objects.create(order_time=localtime,order_bz="无",order_pro_id=i.fav_pro_id,user_name_id=username,order_state_id=1)
    favorite_data = models.favorite.objects.filter(user_name_id=username).delete()
    if request.method == 'POST':
        phone= request.POST.get('phone')
        phone_data=models.product.objects.filter(pro_name__contains=phone)
        Error=""
        if bool(phone_data)==False:
            Error="未查询到结果"
        return render(request,"search.html",{"username":username,"phone_data":phone_data,"error":Error})
    return render(request,"jiesuan.html")
# 我的订单
def myorder(request):
    username = request.session.get("username")
    order_data=models.order.objects.filter(user_name_id=username)
    if request.method == 'POST':
        phone= request.POST.get('phone')
        phone_data=models.product.objects.filter(pro_name__contains=phone)
        Error=""
        if bool(phone_data)==False:
            Error="未查询到结果"
        return render(request,"search.html",{"username":username,"phone_data":phone_data,"error":Error})
    return render(request,"myorder.html",{"username":username,"order_data":order_data})
#管理员登陆页面
#筛选
def search(request):
    username = request.session.get("username")
    pk = request.GET.get('pk')
    phone = request.POST.get('phone')
    print(phone)
    if request.method == 'POST':
        phone= request.POST.get('phone')
        phone_data=models.product.objects.filter(pro_name__contains=phone)
        Error=""
        if bool(phone_data)==False:
            Error="未查询到结果"
        return render(request,"search.html",{"username":username,"phone_data":phone_data,"error":Error})
    return render(request,"search.html",{"username":username})

#管理员登陆
def adminlogin(request):
    if request.method=="POST":
        adminuser=request.POST.get("adminuser")
        adminpwd=request.POST.get("adminpwd")
        if models.admin.objects.filter(admin_name=adminuser):
            admin_data=models.admin.objects.get(admin_name=adminuser)
            if adminpwd==admin_data.admin_pwd:
                request.session['adminuser'] = adminuser
                return redirect("/product_list/")
            else:
                error = "密码错误"
                return render(request, "adlogin.html", {"error": error})
        else:
            error="账号不存在"
            return render(request, "adlogin.html",{"error":error})

    return render(request,"adlogin.html")

# 商品列表
def product_list(request):
    adminuser=request.session.get("adminuser")
    procuct_list=models.product.objects.all()
    return render(request,"product_list.html",{"adminuser":adminuser,"procuct_list":procuct_list})

#商品删除
def product_delete(request):
    pk = request.GET.get('pk')
    models.product.objects.filter(pk=pk).delete()
    return redirect("/product_list/")
# 商品编辑
def product_edit(request):
    pk = request.GET.get('pk')
    product_data=models.product.objects.get(pk=pk)
    type_data=models.ptype.objects.all()
    if request.method=="POST":
        pro_name = request.POST.get("pro_name")
        pro_type = request.POST.get("pro_type")
        pro_des = request.POST.get("pro_des")
        pro_price = request.POST.get("pro_price")
        product_data.pro_name=pro_name
        product_data.pro_type_id=pro_type
        product_data.pro_description=pro_des
        product_data.pro_price=pro_price
        product_data.save()
        return redirect("/product_list/")
    return render(request,"product_edit.html",{"product":product_data,"type_data":type_data})

def product_add(request):
    types=models.ptype.objects.all()
    if request.method=="POST":

        name=request.POST.get("name")
        type=request.POST.get("type")
        des=request.POST.get("des")
        price=request.POST.get("price")
        price=int(price)



        # 上传文件
        myFile = request.FILES.get("file", None)  # 获取上传的文件，如果没有文件，则默认为None
        destination = open(os.path.join("static/img", myFile.name), 'wb+')  # 打开特定的文件进行二进制的写操作
        for chunk in myFile.chunks():  # 分块写入文件
            destination.write(chunk)
        destination.close()
        print(myFile,name, type, des, price)
        models.product.objects.create(pro_name=name, pro_img="img/"+str(myFile), pro_description=des, pro_price=price,
                                      pro_type_id=type)
        return redirect("/product_list/")

    return render(request,"product_add.html",{"types":types})

def user_list(request):
    adminuser=request.session.get("adminuser")
    user_list=models.userinfo.objects.all()
    return render(request,"user_list.html",{"user_list":user_list,"adminuser":adminuser})
def user_edit(request):
    pk = request.GET.get('pk')
    user_data = models.userinfo.objects.get(pk=pk)
    if request.method=="POST":
        user_truename = request.POST.get("user_turename")
        print(user_truename)
        user_sex = request.POST.get("user_sex")
        user_phone=request.POST.get("user_phone")
        user_data.user_turename=user_truename
        user_data.user_sex=user_sex
        user_data.user_phone=user_phone
        user_data.save()
        return redirect("/user_list/")
    return render(request,"user_edit.html",{"user":user_data})

# 展示管理员列表
def admin_list(request):
    adminuser = request.session.get("adminuser")
    admin_data=models.admin.objects.all()
    return render(request,"admin_list.html",{"admin_data":admin_data,"adminuser":adminuser})

#删除管理员
def admin_del(request):
    pk = request.GET.get('pk')
    models.admin.objects.filter(pk=pk).delete()
    return redirect("/admin_list/")

#编辑管理员
def admin_edit(request):
    pk = request.GET.get('pk')
    admin_data = models.admin.objects.get(pk=pk)
    if request.method=="POST":
        admin_pwd=request.POST.get("admin_pwd")
        admin_data.admin_pwd=admin_pwd
        admin_data.save()
        return redirect("/admin_list/")
    return render(request,"admin_edit.html",{"admin_data":admin_data})
# 添加管理员
def admin_add(request):
    if request.method=="POST":
        adusr=request.POST.get("adusr")
        adpwd=request.POST.get("adpwd")
        if models.admin.objects.filter(pk=adusr):
            error="用户名已存在！"
            return render(request,"admin_add.html",{"error":error})
        else:
            models.admin.objects.create(admin_name=adusr,admin_pwd=adpwd)
            return redirect("/admin_list/")
    return render(request,"admin_add.html")
# 展示订单列表
def order_list(request):
    order_list=models.order.objects.all()
    return render(request,"order_list.html",{"order_list":order_list})
# 订单删除
def order_del(request):
    pk = request.GET.get('pk')
    models.order.objects.filter(pk=pk).delete()
    return redirect("/order_list/")
# 订单发货
def order_fahuo(request):
    pk = request.GET.get('pk')
    order=models.order.objects.get(pk=pk)
    order.order_state_id=2
    order.save()
    return redirect("/order_list/")