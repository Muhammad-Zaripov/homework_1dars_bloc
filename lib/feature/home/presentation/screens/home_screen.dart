import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/category_widget.dart';
import '../widgets/products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // forceMaterialTransparency: true,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery address',
              style: GoogleFonts.inter(fontSize: 10, color: Colors.grey),
            ),
            Text(
              'Salatiga City, Central Java',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (value) {
                context.read<ProductBloc>().add(
                  SearchProductEvent(query: value),
                );
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search here...',
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSliderWidget(),
              SizedBox(height: 6),
              Text(
                'Category',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                ],
              ),
              SizedBox(height: 13),
              Row(children: [Text('Recent product')]),
              SizedBox(height: 13),
              ProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
