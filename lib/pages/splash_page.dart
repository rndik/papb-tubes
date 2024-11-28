import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/providers/product_provider.dart';
import 'package:flutter_application_2/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    
    getInit();

    super.initState();
  }

  getInit() async{
    await Provider.of<ProductProvider>(context,listen: false).getProducts();
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 200,
          height: 220,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image_splash2.png'))),
        ),
      ),
    );
  }
}
