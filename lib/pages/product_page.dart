import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/theme.dart';

class ProductPage extends StatefulWidget {
  
  final ProductModel product;
  ProductPage(this.product);
  

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png'
  ];

  List familiarSteel = [
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
    'assets/image_steel.png',
  ];

  int currentIndex = 0;
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccesDialog() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) => SizedBox(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: backgroundColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: primaryTextColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/icon_success.png',
                          width: 100,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Barang berhasil ditambahkan',
                          style: primaryTextStyle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: 154,
                          height: 44,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/cart', (route) => false);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(
                              'Lihat Keranjang',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 2,
        ),
      );
    }

    Widget familiarSteelCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
            ),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left,color: blackColor,),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Icon(Icons.shopping_bag,color: blackColor,)),
              ],
            ),
          ),
          Container(
            child: CarouselSlider(
              items: widget.product.galleries
                  .map(
                    (image) => Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 9.0), // Jarak antar gambar
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Memberikan radius sudut
                        child: Image.network(
                          image.url,
                          width: MediaQuery.of(context).size.width *
                              0.7, // Mengatur ukuran gambar
                          height: 310,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                enlargeCenterPage: true, // Membuat gambar di tengah lebih besar
                enableInfiniteScroll: true, // Untuk infinite scroll (opsional)
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // HEADER
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          widget.product.category.name,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishlist = !isWishlist;
                      });

                      if (isWishlist) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              'Barang ditambahkan ke Wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              'Barang dihapus dari Wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      isWishlist
                          ? 'assets/button_wishlist_blue.png'
                          : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),

            //PRICE
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga mulai dari',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'Rp.${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 17,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),

            // DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: primaryTextStyle.copyWith(
                        fontWeight: bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description,
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            //familiarSteel
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Produk Lain',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarSteel.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarSteelCard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // BUTTONS
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 80),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                          onPressed: () {
                            showSuccesDialog();
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: primaryColor),
                          child: Text(
                            'Tambah ke Keranjang',
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: semiBold),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
