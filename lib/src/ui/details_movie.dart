import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/movie.dart';
import 'package:movie_app/src/ui/booking_page.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/src/ui/widget/content_details.dart';
import 'package:movie_app/src/ui/widget/loading.dart';

class DetailsMovie extends StatefulWidget {
  final int itemIndex;

  @override
  _DetailsMovieState createState() => _DetailsMovieState();

  DetailsMovie(this.itemIndex);
}

class _DetailsMovieState extends State<DetailsMovie> {
  //List<Movie> movieList = List();

  Movie movie;
  List movieList;
  static var urlMovie = "https://dgvapi.herokuapp.com/movies";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataMovie();
  }

  _fetchDataMovie() async {
    var res = await http.get(urlMovie);
    var decode = jsonDecode(utf8.decode(res.bodyBytes));
    setState(() {
      movie = Movie.fromJson(decode);
      //print(movie.toJson());
    });
    Future.delayed(Duration(seconds: 2), () {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoadContent()));
      _fetchDataMovie();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: movie == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Text(movie.data[widget.itemIndex].movieName),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
//        padding: MediaQuery.of(context).padding,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                FlutterYoutube.playYoutubeVideoByUrl(
                  apiKey: "AIzaSyCgzY57cD1lg_iVJT9JVI5_2MQuzXetKcA",
                  videoUrl: "https://www.youtube.com/watch?v=jhtKTKn6PlI",
                  autoPlay: true,
                  fullScreen: false,
                );
              },
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: movie == null
                    ? Loading()
                    : Image.network(
                        movie.data[widget.itemIndex].moviePoster,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Container(
              //alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 2.4, top: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              //color: Colors.orange,
              child: IconButton(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                color: Colors.white,
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  FlutterYoutube.playYoutubeVideoByUrl(
                    apiKey: "AIzaSyCgzY57cD1lg_iVJT9JVI5_2MQuzXetKcA",
                    videoUrl: movie.data[widget.itemIndex].movieTrailer,
                    autoPlay: true,
                    fullScreen: false,
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(14.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  movie == null
                                      ? Loading()
                                      : Text(
                                          movie
                                              .data[widget.itemIndex].movieName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                  movie == null
                                      ? Loading()
                                      : Text(
                                          "Thoi gian: " +
                                              movie.data[widget.itemIndex]
                                                  .movieLength,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      movie == null
                          ? Loading()
                          : Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      movie.data[widget.itemIndex].moviePoster),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 16.0),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: movie == null
                        ? Loading()
                        : Column(
                            children: <Widget>[
                              Content(widget.itemIndex, "DIỄN VIÊN",
                                  "Rian Johnson"),
                              Content(
                                widget.itemIndex,
                                "THỂ LOẠI",
                                movie.data[widget.itemIndex].movieGenres
                                    .toString(),
                              ),
                              Content(widget.itemIndex, "LOẠI PHIM",
                                  movie.data[widget.itemIndex].movieFormat),
                              Content(widget.itemIndex, "NGÀY KHỞI CHIẾU",
                                  movie.data[widget.itemIndex].movieRelease),
                            ],
                          ),
                  ),
                  movie == null
                      ? Loading()
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            movie.data[widget.itemIndex].movieDescription,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.blue,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Booking",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookingPage(widget.itemIndex)));
                      },
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
