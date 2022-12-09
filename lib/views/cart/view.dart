import 'package:flutter/material.dart';
import 'package:nodaliza_store/constants.dart';
import 'package:nodaliza_store/widgets/confirm_button.dart';
import 'package:nodaliza_store/widgets/my_text.dart';

import '../../widgets/cart_card.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(
          data: "Cart",
          color: kBlackColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Divider(height: 1, color: kBlackColor),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return CartCard(
                  title: cartItems[index]['title'],
                  image: cartItems[index]['image'],
                  description: cartItems[index]['description'],
                  price: cartItems[index]['price'],
                  onRemove: () {
                    cartItems.removeAt(index);
                    setState(() {});
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(color: kBlackColor),
              itemCount: cartItems.length,
            ),
          ),
          ConfirmButton(
            title: 'Checkout',
            verticalMargin: 10,
            horizontalMargin: 20,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}


List<Map<String, dynamic>> cartItems = [
  {
    'title': "Classic Coat",
    "price": 1200,
    "description": "london coat brand",
    'image': 'banana',
  },
  {
    'title': "Bell Paper Red",
    "price": 300,
    "description": "dress for kids",
    'image': 'dress',
  },
];