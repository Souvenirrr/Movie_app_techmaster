import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/widget/list_grid_view.dart';
import 'package:movie_app/src/ui/widget/slide_show.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            leading: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.account_circle),
              onPressed: () {
                print("Clicked...");
              },
            ),
            title: Text(
              "Nguyen Van A",
              style: TextStyle(color: Colors.blue),
            ),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Image.network(
                  "https://lh3.googleusercontent.com/PPy0A3ZJz2gKb9xzTw8FDtuVDKnviZEBU0Rk0M4Lptfw_gH74aBBi3lJ1mWMKeOQXyo",
                  width: 50,
                  height: 30,
                ),
              ),
            ],
            elevation: 0.0,
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: <Widget>[
                Container(
                  //alignment: Alignment.topLeft,
                  //margin: EdgeInsets.fromLTB(0, 0, 0, 5),
                  child: Text(
                    "ĐANG CHIẾU",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                 //color: _tabController.index == 2 ? Colors.blue : Colors.grey,
                  child: Text(
                    "SẮP CHIẾU",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  //margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    "ĐẶC BIÊT",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: SlideShow(),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 20),
                      color: Colors.orange,
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridViewPage(),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: SlideShow(),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      //color: Colors.orange,
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridViewPage(),
                    )
                  ],
                ),
                Container(
                  child: Center(
                    child: SlideShow(),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
