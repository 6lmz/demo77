from django.urls import path
from front import views
app_name='front'
urlpatterns = [
    path('index', views.index,name='index'),
    path('denglu', views.denglu,name='denglu'),
    path('register', views.register,name='register'),
    path('index2/(?P<id>[0-9]*)', views.index2,name='index2'),
    path('information/(?P<id>[0-9]*)', views.information,name='information'),
    path('history/(?P<id>[0-9]*)', views.history,name='history'),
    path('index3/(?P<id>[0-9]*)', views.index3,name='index3'),
    path('information3/(?P<id>[0-9]*)', views.information3,name='information3'),
    path('trainInformation/(?P<id>[0-9]*)', views.trainInformation,name='trainInformation'),
    path('select_traininfo/(?P<id>[0-9]*)', views.select_traininfo,name='select_traininfo'),
    path('select_traininfo2/(?P<id>[0-9]*)', views.select_traininfo2, name='select_traininfo2'),
    path('travellerInformation/(?P<id>[0-9]*)', views.travellerInformation,name='travellerInformation'),
    path('count/(?P<id>[0-9]*)', views.count,name='count'),
    path('other/(?P<id>[0-9]*)', views.other,name='other'),
    path('findtrain',views.findtrain,name='findtrain'),
    path('findtrains',views.findtrains,name='findtrains'),
    path('findpost',views.findpost,name='findpost'),
    path(r'deletetrain/(?P<tid>[0-9]*)/(?P<id>[0-9]*)',views.deletetrain,name='deletetrain'),
    path('buy/(?P<uid>[0-9]*/(?P<tid>[0-9]*))',views.buy,name='buy'),
    path('problem',views.problem),
    path('addtrain/(?P<id>[0-9]*)',views.addtrain,name="addtrain"),
    path('updatatrain/(?P<id>[0-9]*)/(?P<uid>[0-9]*)',views.updatatrain,name="updatatrain"),
    path('tankuang/(?P<num>[0-9]*)',views.tankuang,name='tankuang'),
]
# path('find_train', views.find_train,name='find_train'),