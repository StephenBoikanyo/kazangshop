import 'package:flutter/material.dart';
import 'package:kanzangshop/components/components.dart';

class ProductTile extends StatelessWidget {
  final String productImage;
  final String productSummary;
  final String productTitle;
  final onPressed;

  ProductTile(
      {required this.productImage,
      required this.productTitle,
      required this.productSummary,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white24,
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(productImage)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  productTitle,
                  style: kTitleStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  productSummary,
                  style: kSummaryStyle,
                  textAlign: TextAlign.justify,
                )
              ],
            )),
      ),
    );
  }
}
