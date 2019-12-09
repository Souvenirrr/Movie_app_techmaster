import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/loginModel.dart';
import 'package:movie_app/src/ui/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart' as validator;
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String password;
  final formKey = GlobalKey<FormState>();
  LoginModel loginModel;



  Future<void> _createPost() async {
    final response = await http.post(
      'https://dgvapi.herokuapp.com/user/login',
      body: jsonEncode(
        {
          'username' : '$username',
          'password' : '$password',
        },
      ),
      headers: {"Content-Type": "application/json"},
    );
    setState(() {
      loginModel = LoginModel.fromJson(jsonDecode(response.body));
    });

    //_getToken();
    await _saveToken(loginModel.data);
    //print(loginModel.data);
  }

  Future<void> _saveToken(String token) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }

  Future<String> _getToken() async{
    final sharedPreferences = await SharedPreferences.getInstance();
    final token1 = sharedPreferences.getString('token') ?? "";
    return token1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: //loginModel == null ? Center(child: CircularProgressIndicator(),) :
      SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset('beta.png',
                    width:MediaQuery.of(context).size.width/3),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Username khong hop le";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      username = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: true,
                    validator: (String value) {
                      if (value.length < 5) {
                        return "Password khong hop le";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      password = value;
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      //print("Email la: " + phone.toString());
                      //print("Password la: " + password.toString());
                      //_createPost();
                      await _createPost();
                      //if(loginModel.status == "success"){
                        Navigator.pushNamed(context, '/');
                        print(_getToken());
//                      }else{
//                        AlertDialog(
//                          title: Text("Thong bao"),
//
//                        );
//                      }
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Chưa có tài khoản, ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Dang ky");
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
