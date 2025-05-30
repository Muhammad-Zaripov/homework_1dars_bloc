abstract class ProductEvent {}

class LoadProductsEvent extends ProductEvent {}

class SearchProductEvent extends ProductEvent {
  final String query;
  SearchProductEvent({required this.query});
}
