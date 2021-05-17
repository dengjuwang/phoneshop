# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='com_name',
            field=models.ForeignKey(to='app.userinfo'),
        ),
        migrations.AlterField(
            model_name='comment',
            name='com_proid',
            field=models.ForeignKey(to='app.product'),
        ),
        migrations.AlterField(
            model_name='favorite',
            name='fav_pro',
            field=models.ForeignKey(to='app.product'),
        ),
        migrations.AlterField(
            model_name='favorite',
            name='user_name',
            field=models.ForeignKey(to='app.userinfo'),
        ),
        migrations.AlterField(
            model_name='order',
            name='order_pro',
            field=models.ForeignKey(to='app.product'),
        ),
        migrations.AlterField(
            model_name='order',
            name='order_state',
            field=models.ForeignKey(to='app.state'),
        ),
        migrations.AlterField(
            model_name='order',
            name='user_name',
            field=models.ForeignKey(to='app.userinfo'),
        ),
        migrations.AlterField(
            model_name='prodeploy',
            name='prode_proid',
            field=models.ForeignKey(to='app.product'),
        ),
        migrations.AlterField(
            model_name='product',
            name='pro_type',
            field=models.ForeignKey(to='app.ptype'),
        ),
    ]
