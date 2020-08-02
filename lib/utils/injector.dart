import 'package:flutter/material.dart';
import 'package:fluttermvvm/features/details/details_view.dart';
import 'package:fluttermvvm/features/home/home_view.dart';
import 'package:fluttermvvm/features/home/home_viewmodel.dart';
import 'package:fluttermvvm/models/discovery.dart';
import 'package:fluttermvvm/utils/repository.dart';

class Injector {
  Map<String, Widget> pageMap;

  Route injectGenerateRoute(RouteSettings settings) {
    //pages
    return new MaterialPageRoute(builder: (context) {
      if (settings.name == DetailView.detailRoute) {
        final result = settings.arguments as Results;
        return DetailView(result);
      } else {
        return null;
      }
    });
  }
}
