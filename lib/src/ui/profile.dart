import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/infoModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  InfoModel infoModel;
  var token;
  void _removeToken() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<String> _getToken() async{
    final sharedPreferences = await SharedPreferences.getInstance();
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

  void _updateProfile() async{
    final reponse = await http.post("");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Colors.brown,
        title: Text(
          "Hồ sơ",
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/');
                _removeToken();
              },
              child: Text("Cập nhật",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
      body:
      //infoModel == null ? Center(child: CircularProgressIndicator(),) :
      SingleChildScrollView(
        child: infoModel == null ? Center(child: CircularProgressIndicator(),) :
        Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15),
                child: CircleAvatar(
                  //backgroundColor: Colors.red,
                  radius: 90,
                  backgroundImage: NetworkImage(
                      infoModel.data.userAvatar),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Đổi ảnh đại diện",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 40, right: 50),
                      title: Text(
                        "Tên đầy đủ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(infoModel.data.userFullname),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 40, right: 50),
                      title: Text(
                        "Ngày sinh",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          infoModel.data.userBirthday),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 40, right: 50),
                      title: Text(
                        "Giới tính",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: infoModel.data.userGender == 1 ? Text("Nam") : Text("Nữ"),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 40, right: 50),
                      title: Text(
                        "Số điện thoại",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(infoModel.data.userPhone),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 40, right: 50),
                      title: Text(
                        "Địa chỉ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          infoModel.data.userCity),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 40, right: 50),
                      title: Text(
                        "Email",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          infoModel.data.userEmail),
                    ),
                    Container(
                      color: Colors.grey[200],
                      width: MediaQuery.of(context).size.width - 200,
                      child: RaisedButton(
                        child: Text("Logout", style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          _removeToken();
                          Navigator.pushNamed(context, '/');
                        },
                        color: Colors.blue,
                      ),
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