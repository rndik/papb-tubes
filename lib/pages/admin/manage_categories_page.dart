import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class ManageCategoriesPage extends StatelessWidget {
  const ManageCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Categori Toko',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false, // Menampilkan tombol kembali
      );
    }

    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {
          // Aksi tombol tambah kategori
          Navigator.pushNamed(context, '/add-category');
        },
        backgroundColor: secondaryColor,
        shape: const CircleBorder(),
        child: Icon(Icons.add, size: 24, color: Colors.white),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              // Daftar kategori
              ListTile(
                title: Text('Kategori 1', style: primaryTextStyle),
                trailing: Icon(Icons.edit, color: secondaryColor),
                onTap: () {
                  // Aksi edit kategori
                },
              ),
              ListTile(
                title: Text('Kategori 2', style: primaryTextStyle),
                trailing: Icon(Icons.edit, color: secondaryColor),
                onTap: () {
                  // Aksi edit kategori
                },
              ),
            ],
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
              const SizedBox(height: 20),
              Text(
                'Masih belum ada transaksi ditoko?',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 12),
              Text(
                'Ayo kita semangat mencari pelanggan',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      floatingActionButton: addButton(), // Floating button di kanan bawah
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          // Tampilkan `content` atau `emptyOrder` berdasarkan kondisi
          Expanded(
            child: content(), // Tampilkan daftar kategori
            // emptyOrder(), // Jika daftar kosong, gunakan ini
          ),
        ],
      ),
    );
  }
}
