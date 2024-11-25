import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/image_steel.png')
                  ),
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
                    ),
                    Text(
                      'Rp.135.000',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/button_add.png',
                    width: 16,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/button_min.png',
                    width: 16,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon_trash.png',
                width: 10,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Hapus',
                style: alertTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}