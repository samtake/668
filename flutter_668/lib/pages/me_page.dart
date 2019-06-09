import 'package:flutter/material.dart';

class MePage extends StatefulWidget{
  @override
  _MePageStates createState()=> _MePageStates();
}

class _MePageStates extends State<MePage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text('我的'),
        )
    );
  }

}