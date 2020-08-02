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
        height: 400,
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            height: double.maxFinite,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Image.network(
                      _movieDetails.posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  width: double.maxFinite,
                  child: Text(
                    _movieDetails.title,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  width: double.maxFinite,
                  child: Text(
                    "${_movieDetails.voteAverage} Votings",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _titleBodyText(
                            _movieDetails.voteCount.toString(), "Vote Count"),
                        _titleBodyText(_movieDetails.releaseDate, "Release"),
                        _titleBodyText(
                            _movieDetails.adult ? "18+" : "R", "Rating"),
                        _titleBodyText(
                            _movieDetails.originalLanguage, "Language")
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: _titleBodyText("Synopsis", _movieDetails.overview))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleBodyText(String mainText, String subText) {
    return new Column(
      children: [_getText(subText, true), _getText(subText, false)],
    );
  }

  Widget _getText(String text, bool isBold) => Text(
        text,
        style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 15),
      );
}
