import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  String name_seat;
  @override
  _SeatState createState() => _SeatState();
  Seat(this.name_seat);
}

class _SeatState extends State<Seat> {
  bool check;
  Color color;
  @override
  Widget build(BuildContext context) {
    color = check == false ? Colors.blue : Colors.white;
    return Container(
      //color: Colors.blue,
      //alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color:  color,
        border: Border.all(color: Colors.black),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            if(check == false){
              check = true;
            }else{
              check = false;
            }
          });
        },
        child: Text(widget.name_seat),
      ),
    );
  }
}
