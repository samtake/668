import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget{
  @override
  _FriendPageStates createState()=> _FriendPageStates();
}

class _FriendPageStates extends State<FriendPage>{
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: Text('朋友圈'),
        )
    );
  }

}