import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:queues_project/new_home_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    _mockCheckForSession();

  }
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(seconds: 6), () {

      _navigateToHome();

    });

    return true;
  }



  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => NewHomePage()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Opacity(
                  opacity: 0.5,
                  child: Image.asset('assets/queue.jpg')
              ),

              Shimmer.fromColors(
                period: Duration(milliseconds: 1500),
                baseColor: Color(0xff7f00ff),
                highlightColor: Color(0xffe100ff),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Queues' Project",
                    style: TextStyle(
                        fontSize: 90.0,
                        fontFamily: 'Pacifico',
                        shadows: <Shadow>[
                          Shadow(
                              blurRadius: 18.0,
                              color: Colors.black87,
                              offset: Offset.fromDirection(120, 12)
                          )
                        ]
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),


      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            margin: EdgeInsets.symmetric(horizontal: 50.0,vertical: 60.0),
            child: Stack(
              children: [

                Container(
                ),

        SleekCircularSlider(
            appearance: CircularSliderAppearance(
              spinnerMode: true,
              size: 100
            )
        ),


              ],
            ),
          ),
        ],
      ),


    );
  }


}