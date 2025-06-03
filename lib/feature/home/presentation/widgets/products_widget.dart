import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1dars/feature/home/presentation/widgets/products_detailes_widget.dart';

import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return GridView.builder(
            itemCount: state.products.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final product = state.products[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (ctx) => ProductsDetailesWidget(product: product),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          product.image,
                          width: double.infinity,
                          height: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$${product.price.toString()}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff67C4A7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 5,
                              ),
                              child: Center(child: Text('Add to cart')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
