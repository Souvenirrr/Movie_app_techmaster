import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/home_page.dart';

class DetailsMovie extends StatefulWidget {
  @override
  _DetailsMovieState createState() => _DetailsMovieState();
}

class _DetailsMovieState extends State<DetailsMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                "https://images.designtrends.com/wp-content/uploads/2016/04/07124248/Avengers-Background.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(14.0, 200.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Avenger: Endgame",
                                      style: Theme.of(context).textTheme.title),
                                  Text("Thoi gian: 181 phut",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://images.designtrends.com/wp-content/uploads/2016/04/07124248/Avengers-Background.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text("ĐẠO DIỄN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          title: Text("Rian Johnson", style: TextStyle(fontSize: 16),),
                        ),
                        ListTile(
                          leading: Text("ĐẠO DIỄN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          title: Text("Rian Johnson"),
                        ),
                        ListTile(
                          leading: Text("ĐẠO DIỄN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          title: Text("Rian Johnson"),
                        ),
                        ListTile(
                          leading: Text(
                            "THỜI LƯỢNG",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          title: Text("181 phut"),
                        ),
                        ListTile(
                          leading: Text(
                            "NGÀY KHỞI CHIẾU",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          title: Text("29/11/2019"),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      "Hôm nay trời rất đẹp. Trời hôm nay đẹp quá. Tôi muốn đi về nhà. Tôi muốn đi trên chiếc xe máy của mình. Tôi muốn hoàn thành bài viết của mình. Tôi muốn viết cho nó dài dài ra một tí.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: RaisedButton(
                      child: Text("Share"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
    );
  }
}
