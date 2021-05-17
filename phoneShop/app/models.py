from django.db import models
class userinfo(models.Model):
    user_name =models.CharField(max_length=32,primary_key=True)
    user_pwd=models.CharField(max_length=32)
    user_addr=models.CharField(max_length=32)
    user_zip=models.IntegerField()
    user_phone=models.BigIntegerField()
    user_turename=models.CharField(max_length=32)
    user_sex=models.CharField(max_length=32)
    user_email=models.CharField(max_length=32)
    def __str__(self):
        return self.user_name
class admin(models.Model):
    admin_name =models.CharField(max_length=32,primary_key=True)
    admin_pwd=models.CharField(max_length=32)
class ptype(models.Model):
    ptype_id=models.AutoField(primary_key=True)
    ptype_name=models.CharField(max_length=32)

    def __str__(self):
        return self.ptype_name

class product(models.Model):
    pro_id=models.AutoField(primary_key=True)
    pro_name=models.CharField(max_length=32)
    pro_type=models.ForeignKey(ptype,on_delete=models.CASCADE)
    # models.ForeignKey(Publisher, on_delete=models.CASCADE)
    pro_description=models.CharField(max_length=108)
    pro_img=models.ImageField(upload_to='img')
    pro_price=models.IntegerField()
    def __str__(self):
        return self.pro_name
class prodeploy(models.Model):
    prode_id=models.AutoField(primary_key=True)
    prode_proid = models.ForeignKey(product, on_delete=models.CASCADE)
    prode_color = models.CharField(max_length=32)
    pro_ram = models.CharField(max_length=32)
    prode_price=models.IntegerField()


class state(models.Model):
    state_num=models.IntegerField(primary_key=True)
    state_name=models.CharField(max_length=32)
    def __str__(self):
        return self.state_name
class order(models.Model):
    order_id = models.AutoField(primary_key=True)
    order_pro = models.ForeignKey(product, on_delete=models.CASCADE)
    user_name = models.ForeignKey(userinfo, on_delete=models.CASCADE)
    order_time=models.DateTimeField(auto_now=True)
    order_bz=models.CharField(max_length=32)
    order_state=models.ForeignKey(state, on_delete=models.CASCADE)
    def __str__(self):
        return self.order_id
class comment(models.Model):
    com_id=models.AutoField(primary_key=True)
    com_proid=models.ForeignKey(product,on_delete=models.CASCADE)
    com_name=models.ForeignKey(userinfo,on_delete=models.CASCADE)
    com_content=models.CharField(max_length=128)
    come_score=models.IntegerField

class favorite(models.Model):
    fav_id=models.AutoField(primary_key=True)
    fav_pro=models.ForeignKey(product,on_delete=models.CASCADE)
    user_name=models.ForeignKey(userinfo, on_delete=models.CASCADE)
    fav_time=models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.fav_id

class advertise(models.Model):
    adv_id=models.AutoField(primary_key=True)
    adv_pic=models.ImageField(upload_to='/static/img')
    adv_link=models.CharField(max_length=128)
    def __str__(self):
        return self.adv_id
