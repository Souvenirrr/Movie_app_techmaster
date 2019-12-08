import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formRegis = GlobalKey<FormState>();
  var passKey = GlobalKey<FormFieldState>();
  String phone;
  String password;
  String repassword;

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
                      if (value.length  != 10 || !validator.isNumeric(value)) {
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
                    obscureText: false,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Password khong duoc de trong";
                      }else if(value != passKey.currentState.value){
                        return "Password khong trung nhau";
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      repassword = value;
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (formRegis.currentState.validate()) {
                      formRegis.currentState.save();
                      print("Email la: " + phone.toString());
                      print("Password la: " + password.toString());
                      //_createPost();
                      //print("Dang nhap");
                    }
                  },
                  child: Text(
                    "Registration",
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
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
