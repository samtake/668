import 'package:flutter/material.dart';
import 'package:flutter_668/model/common_model.dart';
import 'package:flutter_668/model/grid_nav_model.dart';
import 'package:flutter_668/util/navigator_util.dart';
import 'package:flutter_668/widgets/webView.dart';

//9-11
//网格布局
class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;
  final String name;
  const GridNav({Key key,@required this.gridNavModel,this.name='samtake'}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PhysicalModel(
      child: Column(
        children: _gridNavItems(context),
      ),
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }
    return items;
  }

  _gridNavItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavItem.mainItem));
    items.add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2));
    items.add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4));
    List<Widget> expandItems = [];
    items.forEach((item) {
      expandItems.add(Expanded(
        child: item,
        flex: 1,
      ));
    });
    Color startColor = Color(int.parse('0xff' + gridNavItem.startColor));
    Color endColor = Color(int.parse('0xff' + gridNavItem.endColor));
    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(
        children: expandItems,
      ),
    );
  }

  _mainItem(BuildContext context, CommonModel model) {
    return _warpGesture(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Image.network(
              model.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        model);
  }

/**
 * Expanded
 * 水平方向展开  https://blog.csdn.net/chunchun1230/article/details/82017307
 * 
 * FractionallySizedBox
 * 根据现有空间，来调整child的尺寸，所以说child就算设置了具体的尺寸数值，也不起作用 
 * https://www.cnblogs.com/holy-loki/p/9735056.html
*/
  _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topItem, true),
        ),
        Expanded(
          child: _item(context, bottomItem, false),
        )
      ],
    );
  }

  _item(BuildContext context, CommonModel item, bool first) {
    var borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: borderSide,
                  bottom: first ? borderSide : BorderSide.none)),
          child: _warpGesture(
              context,
              Center(
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              item)),
    );
  }

  _warpGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
              url: model.url,
              title: model.title,
              statusBarColor: model.statusBarColor,
              hideAppBar: model.hideAppBar,
            ));
      },
      child: widget,
    );
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