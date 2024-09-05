import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/detail_chat_page.dart';
import 'package:flutter_application_2/pages/edit_profile_page.dart';
import 'package:flutter_application_2/pages/home/main_page.dart';
import 'package:flutter_application_2/pages/product_page.dart';
import 'package:flutter_application_2/pages/sign_in_page.dart';
import 'package:flutter_application_2/pages/sign_up_page.dart';
import 'package:flutter_application_2/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
      },
    );
  }
}
