import 'package:flutter/material.dart';
import 'package:fluttermvvm/features/details/details_view.dart';
import 'package:fluttermvvm/features/home/home_view.dart';
import 'package:fluttermvvm/utils/injector.dart';
import 'package:fluttermvvm/utils/repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Repository _repository;

  Injector _injector;

  MyApp() {
    this._repository = Repository();
    this._injector = Injector();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePageState(_repository),
      onGenerateRoute: _injector.injectGenerateRoute,
      //routes: {DetailView.detailRoute: (context) => DetailView()},
    );
  }
}
