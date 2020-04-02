import 'package:flutter/material.dart';
import 'package:flutter_668/model/grid_nav_model.dart';

class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  final String name;
  const GridNav({Key key,@required this.gridNavModel,this.name='samtake'}) :super(key:key);

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    // return null;
    return  Text(name);
  }
}



// class GridNav extends StatefulWidget {
//   final GridNavModel gridNavModel;
//   final String name;
//   const GridNav({Key key, @required this.gridNavModel, this.name='samtake'}) :super(key:key);

//   // @override
//   // State<StatefulWidget> createState(){
//   //   //todo:implement createState
//   //   return  null;
//   // }
//   @override
//   _GridNavState createState() => _GridNavState();
// }



// class _GridNavState extends State<GridNav> {
//   @override
//   Widget build(BuildContext context){
//     return  Text(widget.name);
//   }
// }