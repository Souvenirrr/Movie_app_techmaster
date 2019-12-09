import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/movie.dart';
import 'package:movie_app/src/ui/details_movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/src/ui/widget/load_content.dart';
import 'package:movie_app/src/ui/widget/loading.dart';

class GridViewPage extends StatefulWidget {
  var urlMovie;
  @override
  _GridViewPageState createState() => _GridViewPageState();
  GridViewPage(this.urlMovie);
}

class _GridViewPageState extends State<GridViewPage> {
  Movie movie;
  List movieList;


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
      backgroundColor: Colors.grey[200],
      body: movie == null ? Center(
        child: Loading(),
      ) : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: ((MediaQuery.of(context).size.width  * 1.2)) /
              (MediaQuery.of(context).size.height * 1),
        ),
        itemCount: movie.data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                print("Image['" + index.toString() + "']");
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsMovie(index, widget.urlMovie)));
              });
            },
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(20),

              child: Container(
                child: images(index),
                color: Colors.grey[200],
              ),
            ),
          );
        },
      ),
    );
  }

  images(int index) {
    return Container(
      color: Colors.grey[200],
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
       child: Image.network(movie.data[index].moviePoster, fit: BoxFit.cover),
    );
  }
}
