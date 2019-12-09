import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.brown,
        title: Text(
          "Hồ sơ",
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Text("Cập nhật",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Ttem 1"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: Container(
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
                    'http://cdn.shopify.com/s/files/1/0008/1274/4765/products/Shattered-Avengers-Logo_01_Top-View.png?v=1558441924'),
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
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 40, right: 50),
                    title: Text(
                      "Họ và tên",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Trần Công Tùng"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 40, right: 50),
                    title: Text(
                      "Số điện thoại",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("0384386405"),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 40, right: 50),
                    title: Text(
                      "Địa chỉ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "14 ngõ 6 Phạm Tuấn Tài - Quận Tân Phú - Thành phố Hồ Chí Minh"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}