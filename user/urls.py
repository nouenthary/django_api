
from django.urls import path, include
from rest_framework.routers import DefaultRouter
# from .views import ProductViewSet

# router = DefaultRouter()
# router.register(r'products', ProductViewSet)
from user.views import UserAPIView,UserAPIViews

urlpatterns = [
    path('user/', UserAPIView.as_view()),
    path('users/', UserAPIViews.as_view()),
]