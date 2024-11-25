import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/cart_page.dart';
import 'package:flutter_application_2/pages/checkout_page.dart';
import 'package:flutter_application_2/pages/checkout_succes_page.dart';
import 'package:flutter_application_2/pages/detail_chat_page.dart';
import 'package:flutter_application_2/pages/edit_profile_page.dart';
import 'package:flutter_application_2/pages/forgot_password_page.dart';
import 'package:flutter_application_2/pages/home/chat_page.dart';
import 'package:flutter_application_2/pages/home/main_page.dart';
import 'package:flutter_application_2/pages/product_page.dart';
import 'package:flutter_application_2/pages/sign_in_page.dart';
import 'package:flutter_application_2/pages/sign_up_page.dart';
import 'package:flutter_application_2/pages/splash_page.dart';
import 'package:flutter_application_2/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider()
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/forgot-password': (context) => ForgotPasswordPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-succes': (context) => CheckoutSuccesPage(),
          '/myorder': (context) => OrderPage()
        },
      ),
    );
  }
}
