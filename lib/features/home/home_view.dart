import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/features/home/home_viewmodel.dart';
import 'package:fluttermvvm/models/discovery.dart';
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

  /*
   List.generate(
                              resultList.length,
                              (index) => Center(
                                    child: Text(resultList[index].title),
                                  )),
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("widget.title"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: _homeViewModel.discoveries,
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? OrientationBuilder(
                      builder: (context, orientation) {
                        var discoveryResponse =
                            snapshot.data as DiscoveryResponse;
                        List<Results> resultList = discoveryResponse.results;
                        return ListView.builder(
                          itemBuilder: (context, index) =>
                              _listItem(resultList[index]),
                          itemCount: resultList.length,
                        );
                      },
                    )
                  : Column(
                      children: [
                        Text("An Error has occurred"),
                        Icon(
                          Icons.replay,
                          color: Colors.red,
                        )
                      ],
                    );
            },
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _listItem(Results results) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.maxFinite,
      height: 170,
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: 130,
            margin: EdgeInsets.only(top: 15),
            child: Card(),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(),
                width: 120,
                margin: EdgeInsets.only(bottom: 27, left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Image.network(
                    results.posterPath,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 150,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Text(
                        results.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.all(3)),
                    Container(
                      child: Text(
                        results.adult ? "Adult" : "Everyone",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
