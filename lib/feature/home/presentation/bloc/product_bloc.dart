import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework_1dars/feature/home/data/repository/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
    on<SearchProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final allProducts = await repository.fetchProducts();
        final filtered =
            allProducts
                .where(
                  (p) =>
                      p.title.toLowerCase().contains(event.query.toLowerCase()),
                )
                .toList();
        emit(ProductLoaded(filtered));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
