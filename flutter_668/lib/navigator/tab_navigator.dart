import 'package:flutter/material.dart';
import 'package:flutter_668/pages/friend_page.dart';
import 'package:flutter_668/pages/home_page.dart';
import 'package:flutter_668/pages/me_page.dart';
import 'package:flutter_668/pages/run_page.dart';
import 'package:flutter_668/pages/sport_page.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavitorStates createState()=> _TabNavitorStates();
}

class _TabNavitorStates extends State<TabNavigator>{
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SportPage(),
          FriendPage(),
          RunPage(),
          MePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },

          type: BottomNavigationBarType.fixed,

          items:
      [
        BottomNavigationBarItem(
            icon: Icon( Icons.home, color:_defaultColor ),
            activeIcon:Icon( Icons.home, color: _activeColor),
            title: Text('home',
                style: TextStyle(
                    color: _currentIndex != 0 ? _defaultColor : _activeColor),
            )),

        BottomNavigationBarItem(
            icon: Icon( Icons.restaurant, color:_defaultColor ),
            activeIcon:Icon( Icons.restaurant, color: _activeColor),
            title: Text('sport',
              style: TextStyle(
                  color: _currentIndex != 1 ? _defaultColor : _activeColor),
            )),

        BottomNavigationBarItem(
            icon: Icon( Icons.comment, color:_defaultColor ),
            activeIcon:Icon( Icons.comment, color: _activeColor),
            title: Text('friend',
              style: TextStyle(
                  color: _currentIndex != 2 ? _defaultColor : _activeColor),
            )),

        BottomNavigationBarItem(
            icon: Icon( Icons.directions_walk, color:_defaultColor ),
            activeIcon:Icon( Icons.directions_walk, color: _activeColor),
            title: Text('run',
              style: TextStyle(
                  color: _currentIndex != 3 ? _defaultColor : _activeColor),
            )),

        BottomNavigationBarItem(
            icon: Icon( Icons.account_circle, color:_defaultColor ),
            activeIcon:Icon( Icons.account_circle, color: _activeColor),
            title: Text('me',
              style: TextStyle(
                  color: _currentIndex != 4 ? _defaultColor : _activeColor),
            )),
      ]),
    );
  }

}