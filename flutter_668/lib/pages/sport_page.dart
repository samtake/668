import 'package:flutter/material.dart';

class SportPage extends StatefulWidget{
  @override
  _SportPageStates createState()=> _SportPageStates();
}

//class _SportPageStates extends State<SportPage>{
//  final PageController _controller = PageController(
//    initialPage: 0,
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        body: Center(
//          child: Text('运动馆'),
//        )
//    );
//  }
//}


//SliverList
class _SportPageStates extends State<SportPage> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(//SliverAppBar 作为头图控件
              title: Text('base Demo'),// 标题
              floating: true,// 设置悬浮样式
              flexibleSpace: Image.network("https://media-cdn.tripadvisor.com/media/photo-s/13/98/8f/c2/great-wall-hiking-tours.jpg",fit:BoxFit.cover),// 设置悬浮头图背景
              expandedHeight: 280,// 头图控件高度
            ),
            SliverList(//SliverList 作为列表控件
              delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item #$index')),// 列表项创建方法
                childCount: 100,// 列表元素个数
              ),
            ),
          ]);
  }

}