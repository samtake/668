import 'package:flutter/material.dart';
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

  List _imageUrls = [
    'http://c.hiphotos.baidu.com/zhidao/pic/item/9e3df8dcd100baa16788650b4410b912c9fc2edd.jpg',
    'https://www.bing.com/th?id=OIP.wgX4nbb1HaoZw6AUee9rjQHaEn&pid=Api&rs=1&p=0',
    'https://www.bing.com/th?id=OIP.r__gEI3f4onTji9tuFis5gHaKc&pid=Api&rs=1&p=0'
  ];

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
                    Container(
                        height: 800,
                        child: ListTile(
                          title: Text('hahhah'),
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