import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/widget/seat.dart';

class SeatPage extends StatefulWidget{
  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title: Text("Seat Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            //mainAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Screen"),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: <Widget>[
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("A1"),
                        Seat("A2"),
                        Seat("A3"),
                        Seat("A4"),
                        Seat("A5"),
                        Seat("A6"),
                        Seat("A7"),
                        Seat("A8"),
                        Seat("A9"),
                        Seat("A10"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("B1"),
                        Seat("B2"),
                        Seat("B3"),
                        Seat("B4"),
                        Seat("B5"),
                        Seat("B6"),
                        Seat("B7"),
                        Seat("B8"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("C1"),
                        Seat("C2"),
                        Seat("C3"),
                        Seat("C4"),
                        Seat("C5"),
                        Seat("C6"),
                        Seat("C7"),
                        Seat("C8"),
                        Seat("C9"),
                        Seat("C10"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("B1"),
                        Seat("B2"),
                        Seat("B3"),
                        Seat("B4"),
                        Seat("B5"),
                        Seat("B6"),
                        Seat("B7"),
                        Seat("B8"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("C1"),
                        Seat("C2"),
                        Seat("C3"),
                        Seat("C4"),
                        Seat("C5"),
                        Seat("C6"),
                        Seat("C7"),
                        Seat("C8"),
                        Seat("C9"),
                        Seat("C10"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("B1"),
                        Seat("B2"),
                        Seat("B3"),
                        Seat("B4"),
                        Seat("B5"),
                        Seat("B6"),
                        Seat("B7"),
                        Seat("B8"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("C1"),
                        Seat("C2"),
                        Seat("C3"),
                        Seat("C4"),
                        Seat("C5"),
                        Seat("C6"),
                        Seat("C7"),
                        Seat("C8"),
                        Seat("C9"),
                        Seat("C10"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("B1"),
                        Seat("B2"),
                        Seat("B3"),
                        Seat("B4"),
                        Seat("B5"),
                        Seat("B6"),
                        Seat("B7"),
                        Seat("B8"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("C1"),
                        Seat("C2"),
                        Seat("C3"),
                        Seat("C4"),
                        Seat("C5"),
                        Seat("C6"),
                        Seat("C7"),
                        Seat("C8"),
                        Seat("C9"),
                        Seat("C10"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 10.0,
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Seat("B1"),
                        Seat("B2"),
                        Seat("B3"),
                        Seat("B4"),
                        Seat("B5"),
                        Seat("B6"),
                        Seat("B7"),
                        Seat("B8"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                alignment: Alignment.bottomCenter,
                color: Colors.amberAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Tong tien: 150000",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.blue),
                      ),
                      child: Text("Thanh toan"),
                      color: Colors.orange,
                      onPressed: () {
                        print("Thanh toan...");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
