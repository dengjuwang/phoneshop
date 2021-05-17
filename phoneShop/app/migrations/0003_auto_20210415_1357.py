# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_auto_20210405_1100'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userinfo',
            name='user_phone',
            field=models.BigIntegerField(),
        ),
    ]
