import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/providers/auth_provider.dart';
import 'package:flutter_application_2/theme.dart';
import 'package:flutter_application_2/widgets/product_card.dart';
import 'package:flutter_application_2/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    "@${user.username}",
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
  width: 54,
  height: 54,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: user.profilePhotoUrl != null && user.profilePhotoUrl!.isNotEmpty
          ? NetworkImage(user.profilePhotoUrl!)
          : AssetImage('assets/images/placeholder.png'), // Ganti dengan path placeholder Anda
      fit: BoxFit.cover, // Pastikan gambar menutupi lingkaran dengan baik
    ),
  ),
),

          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: primaryColor,
                ),
                child: Text(
                  'Semua Besi',
                  style: primaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  'Pipa',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  'Besi Holo',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  'Plat',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: subtitleColor),
                  color: transparentColor,
                ),
                child: Text(
                  'Baja Ringan',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductsTitle() {
      return Container(
          margin: EdgeInsets.only(
              top: defaultMargin, left: defaultMargin, right: defaultMargin),
          child: Text(
            'Produk Terlaris',
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ));
    }

    Widget popularProducts() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              )
            ])),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
          margin: EdgeInsets.only(
              top: defaultMargin, left: defaultMargin, right: defaultMargin),
          child: Text(
            'Produk Terbaru',
            style:
                primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ));
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
