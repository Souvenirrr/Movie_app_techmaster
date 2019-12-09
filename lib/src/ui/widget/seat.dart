import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/src/ui/seat_page.dart';

class Seat extends StatefulWidget {
  String name_seat;
  int index;
  dynamic IsChoose;
  int count;

  @override
  _SeatState createState() => _SeatState();

  Seat(this.name_seat, this.index, this.IsChoose, this.count);
}

class _SeatState extends State<Seat> {
  bool check = false;
  Color color;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_fetchDataSeat();
    _setColor();
  }

  _setColor() {
    if (widget.IsChoose == true) {
      color = Colors.red;
    } else {
      color = check ? Colors.blue : Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Column(
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
                //_setColor();
                if(widget.IsChoose == null){
                  if (check) {
                    counter.decrement();
                    color = Colors.white;
                  } else {
                    counter.increment();
                    color = Colors.blue;
                  }
                }else{
                  color = Colors.red;
                }
                check = !check;
                //print(counter.count);
              });
            },
            child: Text(widget.name_seat),
          ),
        ),
      ],
    );
  }
}