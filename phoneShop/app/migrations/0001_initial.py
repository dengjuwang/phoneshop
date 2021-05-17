# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='admin',
            fields=[
                ('admin_name', models.CharField(primary_key=True, max_length=32, serialize=False)),
                ('admin_pwd', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='advertise',
            fields=[
                ('adv_id', models.AutoField(primary_key=True, serialize=False)),
                ('adv_pic', models.ImageField(upload_to='img')),
                ('adv_link', models.CharField(max_length=128)),
            ],
        ),
        migrations.CreateModel(
            name='comment',
            fields=[
                ('com_id', models.AutoField(primary_key=True, serialize=False)),
                ('com_content', models.CharField(max_length=128)),
            ],
        ),
        migrations.CreateModel(
            name='favorite',
            fields=[
                ('fav_id', models.AutoField(primary_key=True, serialize=False)),
                ('fav_time', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='order',
            fields=[
                ('order_id', models.AutoField(primary_key=True, serialize=False)),
                ('order_time', models.DateTimeField(auto_now=True)),
                ('order_bz', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='prodeploy',
            fields=[
                ('prode_id', models.AutoField(primary_key=True, serialize=False)),
                ('prode_color', models.CharField(max_length=32)),
                ('pro_ram', models.CharField(max_length=32)),
                ('prode_price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='product',
            fields=[
                ('pro_id', models.AutoField(primary_key=True, serialize=False)),
                ('pro_name', models.CharField(max_length=32)),
                ('pro_description', models.CharField(max_length=108)),
                ('pro_img', models.ImageField(upload_to='img')),
                ('pro_price', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='ptype',
            fields=[
                ('ptype_id', models.AutoField(primary_key=True, serialize=False)),
                ('ptype_name', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='state',
            fields=[
                ('state_num', models.IntegerField(primary_key=True, serialize=False)),
                ('state_name', models.CharField(max_length=32)),
            ],
        ),
        migrations.CreateModel(
            name='userinfo',
            fields=[
                ('user_name', models.CharField(primary_key=True, max_length=32, serialize=False)),
                ('user_pwd', models.CharField(max_length=32)),
                ('user_addr', models.CharField(max_length=32)),
                ('user_zip', models.IntegerField()),
                ('user_phone', models.IntegerField()),
                ('user_turename', models.CharField(max_length=32)),
                ('user_sex', models.CharField(max_length=32)),
                ('user_email', models.CharField(max_length=32)),
            ],
        ),
        migrations.AddField(
            model_name='product',
            name='pro_type',
            field=models.OneToOneField(to='app.ptype'),
        ),
        migrations.AddField(
            model_name='prodeploy',
            name='prode_proid',
            field=models.OneToOneField(to='app.product'),
        ),
        migrations.AddField(
            model_name='order',
            name='order_pro',
            field=models.OneToOneField(to='app.product'),
        ),
        migrations.AddField(
            model_name='order',
            name='order_state',
            field=models.OneToOneField(to='app.state'),
        ),
        migrations.AddField(
            model_name='order',
            name='user_name',
            field=models.OneToOneField(to='app.userinfo'),
        ),
        migrations.AddField(
            model_name='favorite',
            name='fav_pro',
            field=models.OneToOneField(to='app.product'),
        ),
        migrations.AddField(
            model_name='favorite',
            name='user_name',
            field=models.OneToOneField(to='app.userinfo'),
        ),
        migrations.AddField(
            model_name='comment',
            name='com_name',
            field=models.OneToOneField(to='app.userinfo'),
        ),
        migrations.AddField(
            model_name='comment',
            name='com_proid',
            field=models.OneToOneField(to='app.product'),
        ),
    ]
