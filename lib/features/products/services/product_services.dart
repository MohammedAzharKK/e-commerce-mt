import 'dart:convert';

import 'package:e_ommerce_app/features/products/model/product_model.dart';
import 'package:http/http.dart' as http;

// Service class to handle API calls
class ProductServices {
  static const String baseUrl =
      "https://fake-store-api.mock.beeceptor.com/api/products";

  // Fetch products from the API
  static Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // If the server returns an OK response, parse the JSON.
        final json = jsonDecode(response.body);

        List<ProductModel> productList = [];

        for (final item in json) {
          productList.add(ProductModel.fromJson(item));
        }

        return productList; // Return the list of products
      } else {
        // If the server does not return a 200 response, throw an exception.
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the fetch
      throw ('Error fetching products: $e');
    }
  }
}
