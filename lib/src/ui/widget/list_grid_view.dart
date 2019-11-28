import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/details_movie.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  List<String> imagesURL = [
    'https://images-na.ssl-images-amazon.com/images/I/91D1DDCMmQL._SY741_.jpg',
    'https://wallpaperaccess.com/full/294561.jpg',
    'https://images.designtrends.com/wp-content/uploads/2016/04/07124248/Avengers-Background.jpg',
    'https://i.pinimg.com/originals/94/c9/d5/94c9d59dcdcd3ec386fe2bde5b0da5ab.jpg',
    'http://getwallpapers.com/wallpaper/full/5/2/5/583061.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91D1DDCMmQL._SY741_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91D1DDCMmQL._SY741_.jpg',
    'https://ae01.alicdn.com/kf/HTB1RymgeZj_B1NjSZFHq6yDWpXaE/7x5FT-Superhero-Super-Hero-Avengers-Captain-America-Hulk-Iron-Man-Custom-Photo-Studio-Background-Backdrop-Vinyl.jpg',
    'https://ae01.alicdn.com/kf/HTB1OcpkaJfvK1RjSspoq6zfNpXaG/Marvel-Avengers-Super-Hero-Captain-America-Iron-Man-Hulk-background-Computer-print-birthday-photo-backdrop.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91D1DDCMmQL._SY741_.jpg',
    'https://wallpaperaccess.com/full/294561.jpg',
    'https://images.designtrends.com/wp-content/uploads/2016/04/07124248/Avengers-Background.jpg',
    'https://i.pinimg.com/originals/94/c9/d5/94c9d59dcdcd3ec386fe2bde5b0da5ab.jpg',
    'http://getwallpapers.com/wallpaper/full/5/2/5/583061.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91D1DDCMmQL._SY741_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91D1DDCMmQL._SY741_.jpg',
    'https://ae01.alicdn.com/kf/HTB1RymgeZj_B1NjSZFHq6yDWpXaE/7x5FT-Superhero-Super-Hero-Avengers-Captain-America-Hulk-Iron-Man-Custom-Photo-Studio-Background-Backdrop-Vinyl.jpg',
    'https://ae01.alicdn.com/kf/HTB1OcpkaJfvK1RjSspoq6zfNpXaG/Marvel-Avengers-Super-Hero-Captain-America-Iron-Man-Hulk-background-Computer-print-birthday-photo-backdrop.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: ((MediaQuery.of(context).size.width  * 1.2)) /
            (MediaQuery.of(context).size.height * 1),
      ),
      itemCount: imagesURL.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            setState(() {
              print("Image['" + index.toString() + "']");
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsMovie()));
            });
          },
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),

            child: Container(
              child: images(index),
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }

  images(int index) {
    return Container(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
       child: Image.network(imagesURL[index], fit: BoxFit.fill),
    );
  }
}
