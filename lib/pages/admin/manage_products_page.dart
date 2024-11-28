import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class ManageProductsPage extends StatelessWidget {
  const ManageProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Produk Toko',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
      );
    }

    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-product'); // Navigasi ke halaman tambah produk
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
              // Daftar produk
              ListTile(
                leading: Image.asset(
                  'assets/image_steel.png', // Gambar produk
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('Produk 1', style: primaryTextStyle),
                subtitle: Text('Rp 100.000', style: priceTextStyle),
                trailing: Icon(Icons.edit, color: secondaryColor),
                onTap: () {
                  // Aksi edit produk
                },
              ),
              ListTile(
                leading: Image.asset(
                  'assets/image_steel.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text('Produk 2', style: primaryTextStyle),
                subtitle: Text('Rp 200.000', style: priceTextStyle),
                trailing: Icon(Icons.edit, color: secondaryColor),
                onTap: () {
                  // Aksi edit produk
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget emptyProduct() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_empty_product.png', // Ikon jika produk kosong
                width: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'Belum ada produk di toko Anda',
                style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(height: 12),
              Text(
                'Ayo tambahkan produk pertama Anda!',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      floatingActionButton: addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          // Tampilkan `content` atau `emptyProduct` berdasarkan kondisi
          Expanded(
            child: content(), // Jika ada produk
            // emptyProduct(), // Jika produk kosong
          ),
        ],
      ),
    );
  }
}
