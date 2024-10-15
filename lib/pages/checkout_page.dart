import 'dart:io'; // For working with files
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Image Picker package
import 'package:flutter_application_2/theme.dart';
import 'package:flutter_application_2/widgets/checkout_card.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  File? _image; // To store the picked image
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: backgroundColor1,
      elevation: 0,
      centerTitle: true,
      title: Text('Checkout Details'),
    );
  }

  Widget content() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      children: [
        // List Item
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar Barang',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              CheckoutCard(),
              CheckoutCard(),
            ],
          ),
        ),
        // Address Detail
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Alamat',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icon_store_location.png', width: 40),
                      Image.asset('assets/icon_line.png', height: 30),
                      Image.asset('assets/icon_your_address.png', width: 40),
                    ],
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat Toko',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Randu Agung Steel',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                      SizedBox(height: defaultMargin),
                      Text(
                        'Alamat Anda',
                        style: secondaryTextStyle.copyWith(
                            fontSize: 12, fontWeight: light),
                      ),
                      Text(
                        'Bangun Reksa KM6',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Payment Detail
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Pembayaran',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Barang',
                      style: secondaryTextStyle.copyWith(fontSize: 12)),
                  Text('4 Barang',
                      style: primaryTextStyle.copyWith(fontWeight: medium)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Harga Barang',
                      style: secondaryTextStyle.copyWith(fontSize: 12)),
                  Text('Rp.540.000',
                      style: primaryTextStyle.copyWith(fontWeight: medium)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pengiriman',
                      style: secondaryTextStyle.copyWith(fontSize: 12)),
                  Text('Free',
                      style: primaryTextStyle.copyWith(fontWeight: medium)),
                ],
              ),
              SizedBox(height: 12),
              Divider(thickness: 1, color: Color(0xff2E3141)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style: priceTextStyle.copyWith(fontWeight: semiBold)),
                  Text('Rp.540.000',
                      style: priceTextStyle.copyWith(fontWeight: semiBold)),
                ],
              ),
            ],
          ),
        ),
        // Upload Bukti Pembayaran
        Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bukti Pembayaran',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(height: 12),
              _image == null
                  ? Text(
                      'Belum ada gambar terpilih.',
                      style: secondaryTextStyle,
                    )
                  : Image.file(_image!), // Display the picked image
              SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _pickImage, // Upload image button
                icon: Icon(Icons.upload),
                label: Text('Upload Bukti Pembayaran'),
              ),
            ],
          ),
        ),

        //Checkout Button
        SizedBox(
          height: defaultMargin,
        ),
        Divider(
          thickness: 1,
          color: Color(0xff2E3141),
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: defaultMargin,
          ),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/checkout-succes', (route) => false);
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'Checkout Sekarang',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
