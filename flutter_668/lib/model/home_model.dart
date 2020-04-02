import 'package:flutter_668/model/common_model.dart';
import 'package:flutter_668/model/config_model.dart';
import 'package:flutter_668/model/grid_nav_model.dart';
import 'package:flutter_668/model/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel  gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;
  
//构造方法
  HomeModel(
    {this.config,
    this.bannerList,
    this.localNavList,
    this.gridNav,
    this.subNavList,
    this.salesBox});

    factory HomeModel.fromJson(Map<String, dynamic> json) {
      var bannerListJson = json['bannerList'] as List;
      List<CommonModel> bannerList =
          bannerListJson.map((i) => CommonModel.fromJson(i)).toList();
      var localNavListJson = json['localNavList'] as List;
      List<CommonModel> localNavList =
          localNavListJson.map((i) => CommonModel.fromJson(i)).toList();
      var subNavListJson = json['subNavList'] as List;
      List<CommonModel> subNavList =
          subNavListJson.map((i) => CommonModel.fromJson(i)).toList();



      return HomeModel(
          config: ConfigModel.fromJson(json['config']),
          bannerList: bannerList,
          localNavList: localNavList,
          subNavList: subNavList,
          gridNav: GridNavModel.formJson(json['gridNav']),
          salesBox: SalesBoxModel.fromJson(json['salesBox']));
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['config'] = this.config;
        data['bannerList'] = this.bannerList;
        data['localNavList'] = this.localNavList;
        data['subNavList'] = this.subNavList;
        data['gridNav'] = this.gridNav;
        data['salesBox'] = this.salesBox;
        return data;
    }
}