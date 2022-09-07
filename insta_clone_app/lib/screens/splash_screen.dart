import 'package:flutter/material.dart';
import 'package:insta_clone_app/screens/Netflix.dart';
import 'package:lottie/lottie.dart';

class NetflixSplash extends StatefulWidget {
  NetflixSplash({Key? key}) : super(key: key);

  @override
  State<NetflixSplash> createState() => _NetflixSplashState();
}

class _NetflixSplashState extends State<NetflixSplash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Netflix()));
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Lottie.asset('assets/images/splashlogo.json'));
  }
}
