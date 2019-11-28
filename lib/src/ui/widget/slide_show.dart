import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movie_app/src/ui/details_movie.dart';

class SlideShow extends StatefulWidget {
  //const SlideShow{Key key}) : super(key key);
  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  PageController _pageController;

  List<String> images = [
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
    return GestureDetector(
      child: Swiper(
        autoplay: true,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return imageSlider(index);
        },
        onTap: (int index) {
          print("Image['" + index.toString() + "']");
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsMovie()));
        },
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }

  imageSlider(int index) {
    return Container(
      child: Image.network(images[index], fit: BoxFit.fill),
    );
  }
}
