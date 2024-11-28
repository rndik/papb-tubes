import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/admin_profile_page.dart';
import 'package:flutter_application_2/pages/admin/manage_categories_page.dart';
import 'package:flutter_application_2/pages/admin/manage_products_page.dart';
import 'package:flutter_application_2/pages/admin/manage_transactions_page.dart';
import 'package:flutter_application_2/pages/admin/manage_users_page.dart';
import 'package:flutter_application_2/theme.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/button_transaksi.png',
                      width: 17,
                      color: currentIndex == 0 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_product.png',
                      width: 21,
                      color: currentIndex == 1 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/button_category.png',
                      width: 21,
                      color: currentIndex == 2 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/button_users.png',
                      width: 21,
                      color: currentIndex == 3 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 10,
                    ),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color: currentIndex == 4 ? primaryColor : Color(0xff808191),
                    ),
                  ),
                  label: ''),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return ManageTransactionsPage();

        case 1:
          return ManageProductsPage();
        case 2:
          return ManageCategoriesPage();
        case 3:
          return ManageUsersPage();
        case 4:
          return AdminProfilePage();
        default:
          return ManageTransactionsPage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
