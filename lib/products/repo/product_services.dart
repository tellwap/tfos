import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tfos/products/models/api_status.dart';
import 'package:tfos/products/models/product.dart';
import 'package:tfos/utils/constants.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';

class ProductServices {
  static Future<Object> getProducts() async {
    try {
      var url = Uri.parse(PRODUCT_LIST);
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)
            .map((product) => Product.fromJson(product))
            .toList();
        return Success(code: 200, response: data);
      }
      return Failure(code: 100, errorResponse: 'Invalid response');
    } on SocketException {
      return Failure(code: 101, errorResponse: 'Cant connect to server');
    } on HttpException {
      return Failure(code: 102, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 103, errorResponse: 'Invalid format');
    } catch (e) {
      print(e);
      return Failure(code: 104, errorResponse: 'Unknown error');
    }
  }

  static Future<Object> createProduct(Product product, File imageFile) async {
    try {
      var url = Uri.parse(PRODUCT_LIST);
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $_token'
      };

      // open a bytestream
      var stream =
          http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // get file length
      var length = await imageFile.length();

      var request = http.MultipartRequest('POST', url);

      var multipartFile = http.MultipartFile('image', stream, length,
          filename: basename(imageFile.path));

      // add file to multipart
      request.files.add(multipartFile);
      request.fields['name'] = product.name;
      request.fields['category_id'] = product.categoryId.toString();
      request.fields['unit_id'] = product.unitId.toString();
      request.fields['price'] = product.price.toString();
      request.fields['quantity'] = product.quantity.toString();
      request.fields['stock'] = product.stock.toString();
      request.fields['description'] = product.description;

      final response = await request.send();

      // var response = await http.post(url,
      //     body: jsonEncode({
      //       'name': product.name,
      //       'category_id': product.categoryId,
      //       'unit_id': product.unitId,
      //       'price': product.price,
      //       'quantity': product.quantity,
      //       'stock': product.stock,
      //       'description': product.description,
      //     }),
      //     headers: headers);

      print(response.stream.bytesToString());

      if (response.statusCode == 201) {
        // final data = Product.fromJson(
        //     jsonDecode(response.stream.bytesToString() as String));
        print('successfully');
        return Success(code: 201, response: 'data');
      }

      return Failure(code: 100, errorResponse: 'Invalid response');
    } on SocketException {
      return Failure(code: 101, errorResponse: 'Cant connect to server');
    } on HttpException {
      return Failure(code: 102, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 103, errorResponse: 'Invalid format');
    } catch (e) {
      print(e);
      return Failure(code: 104, errorResponse: 'Unknown error');
    }
  }

  static Future<Object> updateProduct(int id, Product product) async {
    try {
      var url = Uri.parse(PRODUCT_LIST + '/$id');
      var response = await http.put(
        url,
        body: {
          'name': product.name,
          'category_id': product.categoryId,
          'unit_id': product.unitId,
          'price': product.price,
          'quantity': product.quantity,
          'stock': product.stock,
          'description': product.description,
        },
      );

      if (response.statusCode == 200) {
        final data = Product.fromJson(jsonDecode(response.body));
        return Success(code: 200, response: data);
      }
      return Failure(code: 100, errorResponse: 'Invalid response');
    } on SocketException {
      return Failure(code: 101, errorResponse: 'Cant connect to server');
    } on HttpException {
      return Failure(code: 102, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 103, errorResponse: 'Invalid format');
    } catch (e) {
      return Failure(code: 104, errorResponse: 'Unknown error');
    }
  }

  static Future<Object> deleteProduct(int id) async {
    try {
      var url = Uri.parse(PRODUCT_LIST + '/$id');
      var response = await http.delete(
        url,
      );

      if (response.statusCode == 200) {
        return Success(code: 200, response: 1);
      }
      return Failure(code: 100, errorResponse: 'Invalid response');
    } on SocketException {
      return Failure(code: 101, errorResponse: 'Cant connect to server');
    } on HttpException {
      return Failure(code: 102, errorResponse: 'No internet');
    } on FormatException {
      return Failure(code: 103, errorResponse: 'Invalid format');
    } catch (e) {
      return Failure(code: 104, errorResponse: 'Unknown error');
    }
  }
}
