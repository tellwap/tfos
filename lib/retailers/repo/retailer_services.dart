import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tfos/retailers/models/api_status.dart';
import 'package:tfos/retailers/models/retailer.dart';
import 'package:tfos/utils/constants.dart';

class RetailerServices {
  static Future<Object> getRetailers() async {
    try {
      var url = Uri.parse(RETAILERS_LIST);
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)
            .map((retailer) => Retailer.fromJson(retailer))
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

  static Future<Object> createRetailers(
      String name, String email, String phone, String address) async {
    try {
      var url = Uri.parse(RETAILERS_LIST);
      var response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'address': address,
          'role': 'retailer',
          'password': "@retailer123",
          'password_confirmation': "@retailer123",
        },
      );
      if (response.statusCode == 201) {
        final data = Retailer.fromJson(jsonDecode(response.body));
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

  static Future<Object> updateRetailer(
      int id, String name, String email) async {
    try {
      var url = Uri.parse(RETAILERS_LIST + '/$id');
      var response = await http.put(
        url,
        body: {'name': name, 'email': email},
      );

      if (response.statusCode == 200) {
        final data = Retailer.fromJson(jsonDecode(response.body));
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

  static Future<Object> deleteRetailer(int id) async {
    try {
      var url = Uri.parse(RETAILERS_LIST + '/$id');
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
