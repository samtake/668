import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_668/dao/home_dao.dart';
import 'package:flutter_668/model/common_model.dart';
import 'package:flutter_668/model/grid_nav_model.dart';
import 'package:flutter_668/model/home_model.dart';
import 'package:flutter_668/widgets/grid_nav.dart';
import 'package:flutter_668/widgets/local_nav.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;
class HomePage extends StatefulWidget{
  @override
  _HomePageStates createState()=> _HomePageStates();
}

class _HomePageStates extends State<HomePage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  double appBarAlpha = 0;
  var resultString = '';
  List<CommonModel> localNavList = [];

//banner image url 
  List _imageUrls = [
    'http://c.hiphotos.baidu.com/zhidao/pic/item/9e3df8dcd100baa16788650b4410b912c9fc2edd.jpg',
    'https://www.bing.com/th?id=OIP.wgX4nbb1HaoZw6AUee9rjQHaEn&pid=Api&rs=1&p=0',
    'https://www.bing.com/th?id=OIP.r__gEI3f4onTji9tuFis5gHaKc&pid=Api&rs=1&p=0'
  ];

@override
void initState(){
  super.initState();
  _loadData();
}


  _onScroll(offset){
    double alpha = offset/APPBAR_SCROLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha=1;
    }

    setState(() {
      appBarAlpha =alpha;
    });
  }


  //  _loadData(){
  //    HomeDao.fetch().then((result){
  //      setState((){
  //        resultString = json.encode(result);
  //        localNavList = result.localNavList;
  //      });
  //    }).catchError((e){
  //      resultString = e.toString();
  //    });
  //  }

 Future<Null> _loadData() async{
   try{
     HomeModel homeModel = await HomeDao.fetch();
     setState(() {
       resultString = json.encode(homeModel);
       localNavList = homeModel.localNavList;
       print(localNavList);
     });
   }catch (e){
     setState(() {
       // resultString = e.toString();
       print(e);
     });
   }

   return null;
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        //Stack 先添加的元素在下面，后添加的元素在上面，一个堆栈
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener(
                onNotification: (scrollNotification){
                  if (scrollNotification is ScrollUpdateNotification &&scrollNotification.depth==0){
                    //滚动切实列表滚动的时候&&第零个元素
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child:Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index){
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: SwiperPagination(),
                      ),
                    ),
                     GridNav(gridNavModel:null,name:'huang'),
                    LocalNav(localNavList: localNavList),
                    Container(
                        height: 800,
                        child: ListTile(
                          title: Text(resultString),
                        )

                    )
                  ],
                ),
              )
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )

        ],
      )
    );
  }

}