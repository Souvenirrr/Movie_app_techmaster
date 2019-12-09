import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart' as validator;
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();

  Login();
}

class _LoginState extends State<Login> {
  String phone;
  String password;
  final formKey = GlobalKey<FormState>();



  void _createPost() async {
    final response = await http.post(
      'http://45.118.145.149:8100/login',
      body: jsonEncode(
        {
          'phone' : '0916512987',
          'password' : '123456',
        },
      ),
      headers: {'Content-Type': "application/json"},
    );
    final LoginModel loginModel = LoginModel.fromJson(jsonDecode(response.body));

    //_getToken();
    _saveToken(loginModel.data.token);
  }

  void _saveToken(String token) async{
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                      hintText: "Phone",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    validator: (String value) {
                      if (value.length != 10 || !validator.isNumeric(value)) {
                        return "Phone khong hop le";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      phone = value;
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
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      formKey.currentState.save();
                      //print("Email la: " + phone.toString());
                      //print("Password la: " + password.toString());
                      //_createPost();
                      _createPost();
                      //print(_getToken());
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
                          Navigator.pushNamed(context, '/register');
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
