import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class WishlistCart extends StatelessWidget {
  const WishlistCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 10, left: 12, bottom: 14,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_steel.png',
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Pipa Galvanis',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'Rp.135.000',
                style: priceTextStyle,
              )
            ],
            ),
          ),
          Image.asset(
            'assets/button_wishlist_blue.png',
            width: 34,
          )
        ],
      ),
    );
  }
}
