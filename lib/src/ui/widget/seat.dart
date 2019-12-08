import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/seatmodel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:movie_app/src/ui/seat_page.dart';

class Seat extends StatefulWidget {
  String name_seat;
  int index;
  bool IsChoose;
  int count;

  @override
  _SeatState createState() => _SeatState();

  Seat(this.name_seat, this.index, this.IsChoose, this.count);
}

class _SeatState extends State<Seat> {
  var urlSeat = "https://api.myjson.com/bins/c4rmy";
  SeatModel seatModel;

  _fetchDataSeat() async {
    var res = await http.get(urlSeat);
    var decode = jsonDecode(res.body);
    setState(() {
      seatModel = SeatModel.fromJson(decode);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataSeat();
    _setColor();
  }
  bool check = false;
  Color color;

  _setCount(){
    print(widget.count);
    if(check){
      widget.count++;
    }else {
      widget.count--;
    }
    print("count là: " + widget.count.toString());
  }

  _setColor() {
    if (widget.IsChoose) {
      color = Colors.red;
    } else if (check) {
      color = Colors.blue;
    } else {
      color = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return seatModel == null
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Column(
      children: <Widget>[
        Container(
          //color: Colors.blue,
          //alignment: Alignment.topCenter,
          margin: EdgeInsets.only(top: 20.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                if (check) {
                  counter.decrement();
                  color = Colors.white;
                } else {
                  counter.increment();
                  color = Colors.blue;
                }
                check = !check;
                print(counter.count);
              });
            },
            child: Text(widget.name_seat),
          ),
        ),
      ],
    );
  }
}