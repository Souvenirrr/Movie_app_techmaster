import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/movie.dart';
import 'package:movie_app/src/ui/seat_page.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarController _calendarController;
  List<String> _cinema = [
    'Rap Thanh Tri',
    'Rap Thai Nguyen',
    'Rap Long Bien',
  ];

  List<dynamic> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
    _selectedEvents = [];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  DateTime value = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Avenger: Endgame 2019"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              calendarController: _calendarController,
              initialCalendarFormat: CalendarFormat.week,
              startDay: value,
              startingDayOfWeek: StartingDayOfWeek.monday,
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
                events = _cinema;

                setState(() {
                  event();
                  _selectedEvents = events;
                });
              },
            ),
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
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: _cinema.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(_cinema[index]),
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "2D",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 6.0,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text(
                            "11:30",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            print(("11:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("13:30"),
                          onPressed: () {
                            print(("13:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("15:30"),
                          onPressed: () {
                            print(("15:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("17:30"),
                          onPressed: () {
                            print(("17:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("19:30"),
                          onPressed: () {
                            print(("19:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("19:30"),
                          onPressed: () {
                            print(("19:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                      ],
                    ),
                    Text(
                      "3D",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 6.0,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("11:30"),
                          onPressed: () {
                            print(("11:30"));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("13:30"),
                          onPressed: () {
                            print(("13:30"));
                          },
                        ),
                      ],
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

  Widget event1() {
    return Container(
      //alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[300],
      //padding: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: _cinema.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(_cinema[index]),
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "2D",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 6.0,
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text(
                            "11:30",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            print(("11:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("15:30"),
                          onPressed: () {
                            print(("15:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("17:30"),
                          onPressed: () {
                            print(("17:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("19:30"),
                          onPressed: () {
                            print(("19:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.white)),
                          child: Text("19:30"),
                          onPressed: () {
                            print(("19:30"));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeatPage()));
                          },
                        ),
                      ],
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
