import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/admin_main_page.dart';
import 'package:flutter_application_2/pages/admin/admin_profile_page.dart';
import 'package:flutter_application_2/pages/cart_page.dart';
import 'package:flutter_application_2/pages/checkout_page.dart';
import 'package:flutter_application_2/pages/checkout_succes_page.dart';
import 'package:flutter_application_2/pages/edit_profile_page.dart';
import 'package:flutter_application_2/pages/forgot_password_page.dart';
import 'package:flutter_application_2/pages/home/chat_page.dart';
import 'package:flutter_application_2/pages/home/main_page.dart';
import 'package:flutter_application_2/pages/sign_in_page.dart';
import 'package:flutter_application_2/pages/sign_up_page.dart';
import 'package:flutter_application_2/pages/splash_page.dart';
import 'package:flutter_application_2/providers/auth_provider.dart';
import 'package:flutter_application_2/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart'; // Import logging package

void main() {
  // Configure logging
  Logger.root.level = Level.ALL; // Atur level log untuk semua pesan
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue, // Atur warna utama aplikasi
          fontFamily: 'Roboto', // Contoh menambahkan font kustom
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/', // Rute awal aplikasi
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/forgot-password': (context) => const ForgotPasswordPage(),
          '/home': (context) => const MainPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-succes': (context) => const CheckoutSuccesPage(),
          '/myorder': (context) => const OrderPage(),
          '/admin-home': (context) => const AdminMainPage(),
          '/admin-profile': (context) => const AdminProfilePage(),
        },
        onUnknownRoute: (settings) {
          // Fallback jika rute tidak ditemukan
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text(
                  '404 - Halaman tidak ditemukan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
