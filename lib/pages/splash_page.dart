import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/sign-in'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 200,
          height: 220,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image_splash2.png'))),
        ),
      ),
    );
  }
}
