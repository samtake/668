import 'package:flutter/material.dart';
import 'package:flutter_668/model/common_model.dart';
// import 'package:flutter_668/model/grid_nav_model.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;


  LocalNav({this.localNavList});

  // const LocalNav({Key key,@required this.localNavList,this.name='samtake'}) :super(key:key);

  @override
  Widget build(BuildContext context){
    // TODO: implement build
    // return null;
    return  Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context){
    if (localNavList==null)  return null;

    List<Widget> items = [];
    localNavList.forEach((model){
      items.add(_item(context,model));
    });
    //包裹，并设置排列方式
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context,CommonModel model){
    return GestureDetector(
      onTap: (){

      },
      child: Column(
        children:<Widget>[
          Image.network(
            model.icon,
            width:32,
            height:32,
          ),
          Text(
            model.title,
            style:TextStyle(fontSize:12),
          )
        ],
      ),
    );
  }
}

