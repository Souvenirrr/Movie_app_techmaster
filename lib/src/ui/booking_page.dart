import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/movie.dart';
import 'package:movie_app/src/model/schedule.dart';
import 'package:movie_app/src/ui/login.dart';
import 'package:movie_app/src/ui/seat_page.dart';
import 'package:movie_app/src/ui/widget/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class BookingPage extends StatefulWidget {
  final int itemIndex;

  @override
  _BookingPageState createState() => _BookingPageState();

  BookingPage(this.itemIndex);
}

class _BookingPageState extends State<BookingPage> {
  CalendarController _calendarController;
  List<dynamic> _selectedEvents;
  Map<DateTime, List> _events;
  Movie movie;
  Schedule schedule;
  var urlMovie = "https://dgvapi.herokuapp.com/movies";
  var urlSchedule = "https://api.myjson.com/bins/17dkus";

  _fetchDataMovie() async {
    var res = await http.get(urlMovie);
    var decode = jsonDecode(utf8.decode(res.bodyBytes));
    setState(() {
      movie = Movie.fromJson(decode);
      //print(movie.toJson());
    });
  }

  _fetchDataSchedule() async {
    var res = await http.get(urlSchedule);
    var decode = jsonDecode(utf8.decode(res.bodyBytes));
    setState(() {
      schedule = Schedule.fromJson(decode);
      //print(movie.toJson());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataMovie();
    _fetchDataSchedule();
    _calendarController = CalendarController();
    _selectedEvents = [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token1 = sharedPreferences.getString('token') ?? "";
    return token1;
  }

  DateTime value = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Lịch chiếu phim"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              calendarController: _calendarController,
              initialCalendarFormat: CalendarFormat.week,
              startDay: value,
              startingDayOfWeek: StartingDayOfWeek.tuesday,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blueAccent[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              onDaySelected: (date, events) {
                print(date.day);
                print(events);
                //events = _cinema;
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            event(),
          ],
        ),
      ),
    );
  }

  Widget event() {
    return Container(
      //alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[300],
      //padding: EdgeInsets.only(top: 10.0),
      child: schedule == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: schedule.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ExpansionTile(
                  title: Text(schedule.data[index].cinemaName),
                  children: <Widget>[
                    schedule == null
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            alignment: Alignment.topCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "2D",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: schedule.data[index].cinemaData
                                      .map((value) => RaisedButton(
                                            color: Colors.white,
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        18.0),
                                                side: BorderSide(
                                                    color: Colors.white)),
                                            child: Text(value.scheduleStart),
                                            onPressed: () async {
                                              Future f = _getToken();
                                              f.then((data) {
                                                if (data != "") {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SeatPage(widget
                                                                  .itemIndex)));
                                                } else {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Login()));
                                                  //print("f" + f.toString());
                                                }
                                              });
                                            },
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                  ],
                );
              },
            ),
    );
  }
}
