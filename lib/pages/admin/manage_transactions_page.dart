import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class ManageTransactionsPage extends StatelessWidget {
  const ManageTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Transaksi Toko',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [],
          ),
        ),
      );
    }

    Widget emptyOrder() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroundColor3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon__empty_cart.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Masih belum ada transaksi ditoko?',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Ayo kita semangat mencari pelanggan',
              style: secondaryTextStyle.copyWith(
                fontSize: 12
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ));
    }

    return Column(
      children: [
        header(),
        emptyOrder(),
      ],
    );
  }
}
