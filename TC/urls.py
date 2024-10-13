"""
URL configuration for TrueCar project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
urlpatterns = [
    path('', views.index),
    path('loginpage', views.loginpage,name='loginpage'),
    path('user_reg', views.user_reg,name='user_reg'),
    path('reg_post', views.reg_post,name='reg_post'),
    path('home', views.home,name='home'),
    path('index', views.index,name='index'),
    path('admin',views.admin,name='admin'),
    path('staff', views.staff, name='staff'),
    path('user', views.user, name='user'),
    path('login',views.login, name='login'),
    path('add_staff', views.add_staff, name='add_staff'),
    path('add_stafff',views.add_stafff,name='add_stafff'),
    path('manage_users',views.manage_users,name='manage_users'),
    path('manage_staff',views.manage_staff,name='manage_staff'),
    path('delete/<int:id>', views.delete, name='delete'),
    path('un_delete/<int:id>', views.un_delete, name='un_delete'),
    path('user_block/<int:id>', views.user_block, name='user_block'),
    path('user_unblock/<int:id>', views.user_unblock, name='user_unblock'),
    path('edit_staff/<int:id>', views.edit_staff,name='edit_staff'),
    path('edit_stafff', views.edit_stafff, name='edit_stafff'),
    path('add_product', views.add_product,name='add_product'),
    path('add_productt', views.add_productt, name='add_productt'),
    path('manage_product', views.manage_product,name='manage_product'),
    path('delete_product/<int:id>', views.delete_product, name='delete_product'),
    path('edit_product/<int:id>', views.edit_product, name="edit_product"),
    path('edit_productt',views.edit_productt, name='edit_productt'),
    path('edit_staff_profile',views.edit_staff_profile, name='edit_staff_profile'),
    path('edit_staff_profile1',views.edit_staff_profile1, name='edit_staff_profile1'),
    path('edit_stafff_profile',views.edit_stafff_profile, name='edit_stafff_profile'),
    path('staff_view_product',views.staff_view_product, name='staff_view_product'),
    path('edit_user_profile',views.edit_user_profile, name='edit_user_profile'),
    path('edit_user_profile1',views.edit_user_profile1, name='edit_user_profile1'),
    path('edit_user_profile_post',views.edit_user_profile_post, name='edit_user_profile_post'),
    path('forgot_password',views.forgot_password, name='forgot_password'),
    path('forgot_password_post',views.forgot_password_post, name='forgot_password_post'),
    path('view_more/<id>',views.view_more, name='view_more'),
    path('staff_product_view_more/<id>',views.staff_product_view_more, name='staff_product_view_more'),
    path('product_view_more/<id>',views.product_view_more, name='product_view_more'),
    path('user_view_profile',views.user_view_profile, name='user_view_profile'),
    path('edit_profile',views.edit_profile, name='edit_profile'),
    path('admin_view_more/<id>',views.admin_view_more, name='admin_view_more'),
    path('add_productt_img',views.add_productt_img, name='add_productt_img'),
    path('search_product',views.search_product, name='search_product'),
    path('staff_view_product_search',views.staff_view_product_search, name='staff_view_product_search'),
    path('admin_view_product_search',views.admin_view_product_search, name='admin_view_product_search'),
    path('admin_staff_search',views.admin_staff_search, name='admin_staff_search'),

]



