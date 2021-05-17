from django.contrib import admin

# Register your models here.
from app.models import userinfo, favorite, order, prodeploy, ptype, state, comment, advertise, product

admin.site.register(userinfo)
admin.site.register(favorite)
admin.site.register(order)
admin.site.register(prodeploy)
admin.site.register(ptype)
admin.site.register(state)
admin.site.register(comment)
admin.site.register(advertise)
admin.site.register(product)

