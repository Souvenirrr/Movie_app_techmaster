class Movie {
  String status;
  String msg;
  List<Data> data;

  Movie({this.status, this.msg, this.data});

  Movie.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int movieId;
  String movieName;
  String movieDescription;
  String movieTrailer;
  String movieCens;
  String movieGenres;
  String movieRelease;
  String movieLength;
  String movieFormat;
  String moviePoster;

  Data(
      {this.movieId,
        this.movieName,
        this.movieDescription,
        this.movieTrailer,
        this.movieCens,
        this.movieGenres,
        this.movieRelease,
        this.movieLength,
        this.movieFormat,
        this.moviePoster});

  Data.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    movieName = json['movieName'];
    movieDescription = json['movieDescription'];
    movieTrailer = json['movieTrailer'];
    movieCens = json['movieCens'];
    movieGenres = json['movieGenres'];
    movieRelease = json['movieRelease'];
    movieLength = json['movieLength'];
    movieFormat = json['movieFormat'];
    moviePoster = json['moviePoster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    data['movieName'] = this.movieName;
    data['movieDescription'] = this.movieDescription;
    data['movieTrailer'] = this.movieTrailer;
    data['movieCens'] = this.movieCens;
    data['movieGenres'] = this.movieGenres;
    data['movieRelease'] = this.movieRelease;
    data['movieLength'] = this.movieLength;
    data['movieFormat'] = this.movieFormat;
    data['moviePoster'] = this.moviePoster;
    return data;
  }
}
