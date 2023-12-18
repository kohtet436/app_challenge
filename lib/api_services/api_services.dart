import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiServices {
//  ApiServices._();
  Future<List<ProductModel>?> getData() async {
    List<ProductModel> data = [];
    try {
      final response = await http.get(
        Uri.parse(
            'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'),
      );
      print("Response=>${response.statusCode}");
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        print("item=>$item");
        data.addAll(List<ProductModel>.from(
            (item).map((x) => ProductModel.fromJson(x))));
        print("data=>$data");
        return data;
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
  }
}
