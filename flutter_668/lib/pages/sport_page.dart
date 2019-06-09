import 'package:flutter/material.dart';

class SportPage extends StatefulWidget{
  @override
  _SportPageStates createState()=> _SportPageStates();
}

class _SportPageStates extends State<SportPage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text('运动馆'),
        )
    );
  }

}