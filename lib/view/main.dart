import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tata_1mg/utils/routes.dart';
import 'package:tata_1mg/view/login_page.dart';
import 'package:tata_1mg/view/product-list.dart';

import 'otp-verification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      themeMode: ThemeMode
          .light, // this alone is not enough, you need to specify the parameters for the dark theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.black26, //swatch gives a similar color palete to the whole page
      ),
      //initialRoute: "/home",
      routes: {
        // "/": (context) => HomePage(), //either run this or the upper Homepage(),
        "/": (context) => ProductList(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.otpRoute: (context) => OtpVerification(),
      }, // uses map : string and context, map : a key and value
    );
  }
}

final List<String> imgList = [
  // undraw.co for open source illustrations
  'https://iili.io/HGgoqJI.png', // to add images locally: yaml.settings, asset section
  'https://iili.io/HMQV5j1.png',
  'https://iili.io/HMQV7ZF.png',
  'https://iili.io/HGgoJWJ.png',
  'https://iili.io/HGgoxxs.png',
];

final List<String> headingList = [
  "Your go-to health app"
      "Know  your medicines"
      "Home delivery of medicines"
      "Lab tests at home"
      "Consult doctors at home"
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfefffe),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselWithDotsPage(imgList: imgList),
          ],
        ),
      ),
    );
  }
}

class CarouselWithDotsPage extends StatefulWidget {
  List<String> imgList;

  CarouselWithDotsPage({required this.imgList});

  @override
  _CarouselWithDotsPageState createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map((item) => Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      top: 0.0,
                      child: Container(
                        decoration: BoxDecoration(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          'No. ${widget.imgList.indexOf(item)} image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            "Your go-to health app",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 70),
          child: Text(
            "Your complete healthcare companion, in your pocket",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.map((url) {
            int index = widget.imgList.indexOf(url);

            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
        Padding(
            padding: EdgeInsets.only(top: 120, left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
                // style: ButtonStyle(elevation: MaterialStateProperty(12.0 )),
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: EdgeInsets.all(20),
                    elevation: 12.0,
                    shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(3),
                    ),
                    textStyle: const TextStyle(color: Colors.white)),

                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
