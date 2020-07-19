import 'package:flutter/material.dart';
import 'package:fluttermvvm/features/home/home_view.dart';
import 'package:fluttermvvm/features/home/home_viewmodel.dart';
import 'package:fluttermvvm/utils/repository.dart';

class Injector {
  Map<String, StatefulWidget> pageMap;

  Injector(Repository repository) {
    pageMap = {"/homeRoute": HomeScreenView(repository)};
  }

  Route injectGenerateRoute(RouteSettings settings) {
    //pages
    return new MaterialPageRoute(builder: (context) {
      return pageMap[settings.name];
    });
  }
}
