import 'package:flutter/material.dart';
import 'package:nodaliza_store/constants.dart';
import 'package:nodaliza_store/widgets/my_text.dart';
import 'package:nodaliza_store/widgets/product_card.dart';
import 'package:nodaliza_store/widgets/search_field.dart';
import 'package:nodaliza_store/widgets/section_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(getAsset('marker')),
                const SizedBox(width: 10),
                MyText(
                  data: 'Mansoura, Egypt',
                  color: kDarkGrayColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ],
            ),
          ),
          const SearchField(),
          Expanded(
            child: ListView(
              children: [
                SectionHeader(
                  title: 'Exclusive Offer',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const ProductCard(
                      title: 'Classic Coat',
                      description: 'london coat brand',
                      price: '1200',
                      image: 'classic-coat',
                    ),
                  ),
                ),
                SectionHeader(
                  title: 'Best Selling',
                  onPressed: () {},
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => const ProductCard(
                      title: 'dress',
                      description: 'dress for kids',
                      price: '300',
                      image: 'dress',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
