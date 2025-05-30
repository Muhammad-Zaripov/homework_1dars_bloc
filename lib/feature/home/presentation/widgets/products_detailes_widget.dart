import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homework_1dars/feature/home/presentation/widgets/custom_colors_widget.dart';
import 'package:homework_1dars/feature/home/presentation/widgets/line_widget.dart';

import '../../data/model/product_model.dart';

class ProductsDetailesWidget extends StatelessWidget {
  final ProductModel product;
  const ProductsDetailesWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Details product'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.network(product.image, width: double.infinity, height: 290),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        product.title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  '\$${product.price.toString()}',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Text('Choose the color'),
                SizedBox(height: 9),
                CustomColorsWidget(),
                SizedBox(height: 12),
                Line(),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          maxRadius: 25,
                        ),
                        Text('Shop UZ'),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Text('Follow'),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Line(),
                SizedBox(height: 12),
                Text(
                  'Description of product',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  product.description,
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff67C4A7),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(15),
              child: Text('Add to Cart'),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
