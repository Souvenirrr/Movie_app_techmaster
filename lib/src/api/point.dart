import 'package:movie_app/src/model/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Point {
  Movie movie;
  List movieList;
  static var urlMovie = "https://api.myjson.com/bins/15xskm?fbclid=IwAR0z2RCwG07JALWpbCexj6D00ZdQPYu1j9GuU8p1SvTlux3yvGgtai9vFEU";

  _fetchDataMovie() async {
    var res =  await http.get(urlMovie);
    var decode = jsonDecode(res.body);
    movie = Movie.fromJson(decode);
    print(movie.toJson());
  }

}