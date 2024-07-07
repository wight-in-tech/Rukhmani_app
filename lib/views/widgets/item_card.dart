import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketshitfchaitanya/constant/app_color.dart';
import 'package:marketshitfchaitanya/core/model/Product.dart';
import 'package:marketshitfchaitanya/views/screens/product_detail.dart';
import 'package:marketshitfchaitanya/views/widgets/rating_tag.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Color titleColor;
  final Color priceColor;

  ItemCard({
    required this.product,
    this.titleColor = Colors.black,
    this.priceColor = AppColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 16 - 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Item Image
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 2 - 16 - 8,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(product.image[0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: RatingTag(
                value: product.rating,
                margin: EdgeInsets.all(4),
              ),
            ),

            // Item Details
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: titleColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 8),
                    child: Text(
                      NumberFormat.currency(
                        locale: 'id', // Replace with your desired locale
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(product.price),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: priceColor,
                      ),
                    ),
                  ),
                  Text(
                    product.storeName,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
