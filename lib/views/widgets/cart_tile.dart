import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketshitfchaitanya/constant/app_color.dart';
import 'package:marketshitfchaitanya/core/model/Cart.dart';

class CartTile extends StatelessWidget {
  final Cart data;

  const CartTile({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        NumberFormat.simpleCurrency(locale: 'id_ID', name: 'IDR');

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.border, width: 1),
      ),
      child: Row(
        children: [
          // Image
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppColor.border,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: AssetImage(data.image[0]), fit: BoxFit.cover),
            ),
          ),
          // Info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  data.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: AppColor.secondary,
                  ),
                ),
                // Product Price - Increment Decrement Button
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Price
                      Expanded(
                        child: Text(
                          formatCurrency.format(data.price),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      // Increment Decrement Button
                      _buildQuantityControl(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Container(
      height: 26,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.primarySoft,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildControlButton('-', () {
            print('minus');
          }),
          Text(
            '${data.count}',
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
          ),
          _buildControlButton('+', () {
            print('plus');
          }),
        ],
      ),
    );
  }

  Widget _buildControlButton(String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 26,
        height: 26,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.primarySoft,
        ),
        child: Text(
          label,
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
