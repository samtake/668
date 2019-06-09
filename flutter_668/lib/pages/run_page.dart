import 'package:flutter/material.dart';

class RunPage extends StatefulWidget{
  @override
  _RunPageStates createState()=> _RunPageStates();
}

class _RunPageStates extends State<RunPage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text('健康跑'),
        )
    );
  }

}