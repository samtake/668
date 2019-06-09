import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageStates createState()=> _HomePageStates();
}

class _HomePageStates extends State<HomePage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('首页'),
      )
    );
  }

}