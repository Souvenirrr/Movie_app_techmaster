import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/seatmodel.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/src/ui/widget/seat.dart';
import 'package:provider/provider.dart';

// ChangeNotifierProvide
class Counter with ChangeNotifier {
  int _count = 0;
  int _totalPrice = 0;
  int _price = 80000;
  int _myMoney = 500000;

  int get count => _count;

  int get totalPrice => _totalPrice;

  int get myMoney => _myMoney;

  increment() {
    _count++;
    _totalPrice = _count * _price;
    notifyListeners();
  }

  decrement() {
    _count--;
    _totalPrice = _count * _price;
    notifyListeners();
  }
}

class SeatPage extends StatefulWidget {
  int index;

  @override
  _SeatPageState createState() => _SeatPageState();

  SeatPage(this.index);
}

class _SeatPageState extends State<SeatPage> {
  var urlSeat = "https://dgvapi.herokuapp.com/seat/1/seat-empty";
  SeatModel seatModel;
  bool check = false;

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
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: Scaffold(
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
                  margin: EdgeInsets.only(top: 20.0, left: 30, right: 30),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Screen", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),),
                ),
                seatModel == null
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(top: 60),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 2,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: seatModel.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Wrap(
                                  runSpacing: 10.0,
                                  spacing: 10.0,
                                  crossAxisAlignment:
                                  WrapCrossAlignment.center,
                                  children: seatModel
                                      .data[index].seats
                                      .map(
                                        (value) =>
                                        Seat(
                                            seatModel
                                                .data[index].row +
                                                value.number.toString(),
                                            index,
                                            value.seatStatus,
                                            count),
                                  )
                                      .toList(),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                new calTotalPrice(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class calTotalPrice extends StatelessWidget {
  const calTotalPrice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    return Container(
      padding: EdgeInsets.only(top: 30),
      alignment: Alignment.bottomCenter,
      //color: Colors.amberAccent,
      child: Column(
        children: <Widget>[
          Container(
            child: Text("Tong so tien cua ban: " + Counter().myMoney.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          Container(
            child: Text(
              "Tong tien: " + counter.totalPrice.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.blue),
            ),
            child: Text("Thanh toan"),
            color: Colors.blue,
            onPressed: () {
              showDialog(context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Thông báo"),
                    content: Text("Bạn có xác nhận thanh toán"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () {
                          if (counter._totalPrice != 0) {
                            if (counter.myMoney >= counter._totalPrice) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Thông báo"),
                                    content: Text("Thanh toán thành công"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Close"),
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/');
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Thông báo"),
                                    content: Text("Thanh toán không thành công"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("Close"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                      FlatButton(
                        child: Text("Huỷ"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },);
            },
          ),
        ],
      ),
    );
  }
}
