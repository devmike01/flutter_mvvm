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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(248, 249, 249, 10),
        appBar: AppBar(
          title: Text("Flutter MVVM"),
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
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.maxFinite,
        height: 220,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              width: double.maxFinite,
              height: double.maxFinite,
              margin: EdgeInsets.only(top: 15),
              child: Card(
                shadowColor: Colors.blueAccent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 0,
                  child: Container(
                    decoration: BoxDecoration(),
                    width: 140,
                    margin: EdgeInsets.only(bottom: 10, left: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.network(
                        results.posterPath,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 195,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 20, bottom: 20),
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 15, top: 30),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Expanded(
                            flex: 0,
                            child: Text(
                              results.title,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                              softWrap: true,
                            )),
                        Padding(padding: EdgeInsets.only(top: 6)),
                        Expanded(
                          flex: 0,
                          child: Text(
                            results.adult ? "Adult" : "Everyone",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "${results.voteCount} Votes",
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.white),
                            softWrap: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Expanded(
                          child: Text(
                            results.overview,
                            maxLines: 3,
                            softWrap: true,
                            textWidthBasis: TextWidthBasis.longestLine,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 13,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 123, bottom: 20),
              child: Container(
                height: 45,
                width: 45,
                alignment: Alignment.center,
                child: Text(
                  results.voteAverage.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        int movieId = results.id;

        //https://api.themoviedb.org/3/discover/movie?api_key=af6b848dcaa72c47a4267e9d66b045c0&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1
      },
    );
  }
}
