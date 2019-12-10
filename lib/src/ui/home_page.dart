import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/infoModel.dart';
import 'package:movie_app/src/ui/widget/list_grid_view.dart';
import 'package:movie_app/src/ui/widget/slide_show.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InfoModel infoModel;
  var token;
  _getToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token1 = sharedPreferences.getString('token') ?? "";
    return token1;
  }

  void _createPost() async {
    token = await _getToken();
    //print(token);
    final response = await http.get(
      'https://dgvapi.herokuapp.com/user/info',
      headers: {'Authorization': 'Bearer $token'},
    );
    print("Bearer $token");

    setState(() {
      infoModel = InfoModel.fromJson(jsonDecode(response.body));
    });
    //_getToken();
    //_saveToken(loginModel.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createPost();
  }

  TabController _tabController;
  bool check = false;

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child:
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            centerTitle: false,
            leading: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.account_circle),
              onPressed: () async {
                //print("Clicked...");
                Future f = _getToken();
                f.then((data) {
                  if(data != ""){
                    check = true;
                    Navigator.pushNamed(context , '/profile');
                    //print("f: " + f.toString());
                  }else{
                    check = false;
                    Navigator.pushNamed(context, '/login');
                    //print("f" + f.toString());
                  }
                });
              },
            ),
            title: check == true ? Text(infoModel.data.userFullname, style: TextStyle(color: Colors.blue),) :
            Text("Guest",style: TextStyle(color: Colors.blue),),
            actions: <Widget>[
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.only(right: 20),
                child: Image.asset(
                  "beta.png",
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
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "ĐANG CHIẾU",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "SẮP CHIẾU",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "ĐẶC BIỆT",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            color: Colors.grey[200],
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: SlideShow("https://dgvapi.herokuapp.com/movies/now"),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 20),
                      color: Colors.orange,
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridViewPage("https://dgvapi.herokuapp.com/movies/now"),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: SlideShow("https://dgvapi.herokuapp.com/movies/future"),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      //color: Colors.orange,
                      height: MediaQuery.of(context).size.height / 2,
                      child: GridViewPage("https://dgvapi.herokuapp.com/movies/future"),
                    )
                  ],
                ),
                Container(
                  child: Center(
                    child: SlideShow("https://dgvapi.herokuapp.com/movies/future"),
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
