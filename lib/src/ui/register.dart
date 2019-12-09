import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/src/model/register_model.dart';
import 'package:validators/validators.dart' as validator;
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formRegis = GlobalKey<FormState>();
  var passKey = GlobalKey<FormFieldState>();
  String username;
  String password;
  String repassword;
  String fullname;
  String birthday;
  String email;
  String phone;
  String city;
  RegisterModel register;

  Future<void> postRegister() async {
    final response = await http.post(
      'https://dgvapi.herokuapp.com/user/login',
      body: jsonEncode({
        "password": "$password",
        "userBirthday": "$birthday",
        "userCity": "$city",
        "userEmail": "$email",
        "userFullname": "$fullname",
        "userPhone": "$phone",
        "username": "$username"
      }),
      headers: {"Content-Type": "application/json"},
    );
    setState(() {
      register = RegisterModel.fromJson(jsonDecode(response.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formRegis,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Image.asset('beta.png',
                      width: MediaQuery.of(context).size.width / 3),
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
                      if (value.length == 0) {
                        return "Username khong duoc de trong";
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
                    key: passKey,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: true,
                    validator: (String value) {
                      if (value.length < 8) {
                        return "Password khong hop le";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      password = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Repassword",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: true,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Password khong duoc de trong";
                      } else if (value != passKey.currentState.value) {
                        return "Password khong trung nhau";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      repassword = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Fullname",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Fullname khong duoc de trong";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      fullname = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Birthday(yy-mm-dd)",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Birthday khong duoc de trong";
                      } else if (!validator.isDate(value)) {
                        return "Birthday chua dung dinh dang";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      birthday = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Email khong duoc de trong";
                      } else if (!validator.isEmail(value)) {
                        return "Email khong dung dinh dang";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      email = value;
                    },
                  ),
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
                    obscureText: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Phone khong duoc de trong";
                      } else if (!validator.isNumeric(value) ||
                          value.length != 10) {
                        return "Phone khong dung dinh dang";
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
                      hintText: "City",
                      border: InputBorder.none,
                      fillColor: Colors.grey[300],
                      filled: true,
                    ),
                    obscureText: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "City khong duoc de trong";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      city = value;
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () async {
                    if (formRegis.currentState.validate()) {
                      formRegis.currentState.save();
                      await postRegister();
                      print("success");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Message"),
                            content: Text("Dang ky thanh cong"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/');
                                },
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      print("fail");
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Message"),
                              content: Text("Dang ky khong thanh cong"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    }
                    print("out");
                  },
                  child: Text(
                    "Registration",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
