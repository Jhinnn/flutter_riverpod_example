import 'package:flutter_riverpod_example/model/product_model.dart';
import 'package:riverpod/riverpod.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  // We initialize the list of todos to an empty list
  ProductNotifier([List<Product>? productList]) : super(productList ?? []);
}
