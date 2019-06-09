import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageStates createState()=> _HomePageStates();
}

class _HomePageStates extends State<HomePage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  List _imageUrls = [
    'http://c.hiphotos.baidu.com/zhidao/pic/item/9e3df8dcd100baa16788650b4410b912c9fc2edd.jpg',
    'https://www.bing.com/th?id=OIP.wgX4nbb1HaoZw6AUee9rjQHaEn&pid=Api&rs=1&p=0',
    'https://www.bing.com/th?id=OIP.r__gEI3f4onTji9tuFis5gHaKc&pid=Api&rs=1&p=0'
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
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
    );
  }

}