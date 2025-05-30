import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((p) => ProductModel.fromJson(p)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
