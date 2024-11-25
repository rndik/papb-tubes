import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/image_steel.png'
                  )
                )
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
                    fontWeight: semiBold
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Rp.135.000',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            '2 Barang',
            style: secondaryTextStyle.copyWith(
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }
}