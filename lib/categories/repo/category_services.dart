import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tfos/categories/models/api_status.dart';
import 'package:tfos/categories/models/category.dart';
import 'package:tfos/utils/constants.dart';

class CategoriesServices {
  static Future<Object> getCategories() async {
    try {
      var url = Uri.parse(CATEGORIES_LIST);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)
            .map((category) => Category.fromJson(category))
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
      return Failure(code: 104, errorResponse: 'Unknown error');
    }
  }

  static Future<Object> createCategory(String name, String details) async {
    print('create category');
    try {
      var url = Uri.parse(CATEGORIES_LIST);
      var response = await http.post(
        url,
        body: {'name': name, 'details': details},
      );
      if (response.statusCode == 201) {
        final data = Category.fromJson(jsonDecode(response.body));
        return Success(code: 201, response: data);
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

  static Future<Object> updateCategory(
      int id, String name, String details) async {
    try {
      var url = Uri.parse(CATEGORIES_LIST + '/$id');
      var response = await http.put(
        url,
        body: {'name': name, 'details': details},
      );

      if (response.statusCode == 200) {
        final data = Category.fromJson(jsonDecode(response.body));
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

  static Future<Object> deleteCategory(int id) async {
    try {
      var url = Uri.parse(CATEGORIES_LIST + '/$id');
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
