import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/models/discovery.dart';

class DetailView extends StatelessWidget {
  final Results _movieDetails;

  DetailView(this._movieDetails);

  static final detailRoute = "/detailRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_movieDetails.originalTitle),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  _movieDetails.posterPath,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 500,
                ),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(20),
                child: Text(
                  _movieDetails.title,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 20),
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      size: 30,
                      color: Colors.orange,
                    ),
                    Text(
                      "${_movieDetails.voteAverage} Voting",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _titleBodyText(
                        _movieDetails.voteCount.toString(), "Vote Count"),
                    padding10LeftRight(),
                    _titleBodyText(_movieDetails.releaseDate, "Release"),
                    padding10LeftRight(),
                    _titleBodyText(_movieDetails.adult ? "18+" : "R", "Rating"),
                    padding10LeftRight(),
                    _titleBodyText(_movieDetails.originalLanguage, "Language")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getText("Synopsis", true),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: _getText(_movieDetails.overview, false),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleBodyText(String mainText, String subText) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_getText(mainText, true), _getText(subText, false)],
    );
  }

  Widget _getText(String text, bool isBold) => Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 15),
      );

  Widget padding10LeftRight() =>
      Padding(padding: EdgeInsets.only(left: 10, right: 10));
}
