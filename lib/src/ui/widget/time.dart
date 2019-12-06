import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/schedule.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/src/ui/seat_page.dart';

class TimePage extends StatefulWidget {
  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  Schedule schedule;
  var urlSchedule = "https://api.myjson.com/bins/17dkus";
  List<String> scheduleList = List();

  _fetchDataSchedule() async {
    var res = await http.get(urlSchedule);
    var decode = jsonDecode(utf8.decode(res.bodyBytes));
    setState(() {
      schedule = Schedule.fromJson(decode);
      //print(movie.toJson());
    });

    if (schedule != null) {
      for (int i = 0; i <= schedule.data.length; i++) {
        for (int j = 0; j <= schedule.data[i].cinemaData.length; j++) {
          scheduleList.add(schedule.data[i].cinemaData[j].scheduleStart);
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataSchedule();
    //_getSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 11,
        child: schedule == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: scheduleList.length,
                itemBuilder: (context, index) {
                  return Wrap(
                    spacing: 50.0,
                    runSpacing: 6.0,
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        child: Text(scheduleList[index]),
                        onPressed: () {
                          //print(("17:30"));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeatPage()));
                        },
                      ),
                    ],
                  );
                }));
  }
}
