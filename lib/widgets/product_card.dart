import 'package:flutter/material.dart';
import 'package:nodaliza_store/constants.dart';
import 'package:nodaliza_store/widgets/my_text.dart';
import '../core/app_router/app_router.dart';
import '../views/cart/view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String title;
  final String description;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: kGrayColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                getAsset(image),
              ),
            ),
          ),
          MyText(
            data: title,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          MyText(
            data: description,
            color: kGrayColor,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                data: '\$$price',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                onTap: () => AppRouter.navigateAndPopAll(context, const CartView()),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kPrimaryColor,
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
