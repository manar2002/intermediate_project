import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_text.dart';

class CartCard extends StatefulWidget {
   const CartCard({
    Key? key,
     required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.onRemove,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;
  final double price;
  final VoidCallback onRemove;
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 96,
        child: Row(
          children: [
            Image.asset(getAsset(widget.image)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    data: widget.title,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 5),
                  MyText(
                    data: widget.description,
                    fontSize: 14,
                    color: kDarkGrayColor,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (count == 1) {
                            widget.onRemove();
                          } else {
                            count--;
                          }
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kDarkGrayColor.withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: kDarkGrayColor.withOpacity(0.8),
                          ),
                        ),
                      ),
                      MyText(
                        data: '$count',
                        horizontalMargin: 10,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      InkWell(
                        onTap: () {
                          count++;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kDarkGrayColor.withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: widget.onRemove,
                  child: const Icon(Icons.close),
                ),
                MyText(data: '${(widget.price * count).toStringAsFixed(2)}\$'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
