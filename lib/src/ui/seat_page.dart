import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title: Text("Seat Page"),
        centerTitle: true,
      ),
      body: Container(
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
                      GestureDetector(
                        onTap: () {
                          print("A1");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A1"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A2");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A2"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A3");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A3"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A4");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A4"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A5");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A5"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A6");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A6"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("A1");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A1"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A2");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A2"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A3");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A3"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A4");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A4"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A5");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A5"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A6");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A6"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    runSpacing: 10.0,
                    spacing: 10.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("A1");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A1"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A2");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A2"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A3");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A3"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A4");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A4"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A5");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A5"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A6");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A6"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("A7");
                        },
                        child: Container(
                          //color: Colors.blue,
                          //alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 20.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text("A7"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
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
                    onPressed: (){
                      print("Thanh toan...");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
