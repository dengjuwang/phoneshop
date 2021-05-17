from django.conf.urls import include, url
from django.contrib import admin
from app import views

urlpatterns = [
    # Examples:
    # url(r'^$', 'phoneShop.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^$',views.login),
    url(r'^login/', views.login),
    url(r'^index/', views.index),
    url(r'^reg/', views.reg),
    url(r'^quit/', views.quit),
    url(r'^good/', views.good),
    url(r'^goshopcar/', views.goshopcar),
    url(r'^shopcar/', views.shopcar),
    url(r'^delfav/', views.delfav),
    url(r'^rusult/', views.result),
    url(r'^myorder/', views.myorder),
    url(r'^search/', views.search),
    url(r'^adminlogin/', views.adminlogin),
    url(r'^product_list/', views.product_list),
    url(r'^product_delete/', views.product_delete),
    url(r'^product_edit/', views.product_edit),
    url(r'^product_add/', views.product_add),
    url(r'^user_list/', views.user_list),
    url(r'^user_edit/', views.user_edit),
    url(r'^admin_list/', views.admin_list),
    url(r'^admin_del/', views.admin_del),
    url(r'^admin_edit/', views.admin_edit),
    url(r'^admin_add/', views.admin_add),
    url(r'^order_list/', views.order_list),
    url(r'^order_del/', views.order_del),
    url(r'^order_fahuo/', views.order_fahuo),
    url(r'^choose/', views.chose),


]


from django.views.static import serve
from .settings import MEDIA_ROOT, DEBUG

if DEBUG:
    urlpatterns += url(r'^static/(?P<path>.*)/$', serve, {'document_root': MEDIA_ROOT}),
