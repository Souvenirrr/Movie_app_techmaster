import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/movie.dart';
import 'package:movie_app/src/ui/details_movie.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/src/ui/widget/loading.dart';

class SlideShow extends StatefulWidget {
  var urlMovie = "";
  //const SlideShow{Key key}) : super(key key);
  @override
  _SlideShowState createState() => _SlideShowState();
  SlideShow(this.urlMovie);
}

class _SlideShowState extends State<SlideShow> {
  PageController _pageController;

  Movie movie;
  List movieList;
  //var urlMovie = "https://dgvapi.herokuapp.com/movies";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataMovie();
  }

  _fetchDataMovie() async {
    var res =  await http.get(widget.urlMovie);
    var decode = jsonDecode(utf8.decode(res.bodyBytes));
    setState(() {
      movie = Movie.fromJson(decode);
      //print(movie.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movie == null ? Center(
          child: Loading(),
        ) : SafeArea(
        child: Swiper(
            autoplay: true,
            itemCount: movie.data.length,
            itemBuilder: (context, index) {
              return imageSlider(index);
            },
            onTap: (int index) {
              print("Image['" + index.toString() + "']");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsMovie(index, widget.urlMovie)));
            },
            pagination: new SwiperPagination(),
            control: new SwiperControl(),
          ),
      ),
      );
  }

  imageSlider(int index) {
    return Container(
      child: Image.network(movie.data[index].moviePoster, fit: BoxFit.cover),
    );
  }
}
