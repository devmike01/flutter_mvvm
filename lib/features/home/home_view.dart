import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/features/home/home_viewmodel.dart';
import 'package:fluttermvvm/utils/repository.dart';

class HomeScreenView extends StatefulWidget {
  final Repository repository;

  HomeScreenView(this.repository);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreenView> {
  HomeViewModel _homeViewModel;

  @override
  void initState() {
    _homeViewModel = HomeViewModel(widget.repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("widget.title"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _homeViewModel.discoveries,
            builder: (context, snapshot) {
              debugPrint(
                  "MESSAGGEGGGEGE + ${snapshot.data} __ ${snapshot.error}");
              return Container();
            },
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
