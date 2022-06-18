import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tfos/manufactures/models/api_status.dart';
import 'package:tfos/manufactures/models/manufacture.dart';
import 'package:tfos/utils/constants.dart';

class ManufactureServices {
  static Future<Object> getManufactures() async {
    try {
      var url = Uri.parse(MANUFACTURES_LIST);
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)
            .map((manufacture) => Manufacture.fromJson(manufacture))
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

  static Future<Object> createManufactures(String name, String email,
      String phone, String address, String password) async {
    try {
      var url = Uri.parse(MANUFACTURES_LIST);
      var response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'address': address,
          'role': 'manufacture',
          'password': password,
          'password_confirmation': password,
        },
      );
      if (response.statusCode == 201) {
        final data = Manufacture.fromJson(jsonDecode(response.body));
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

  static Future<Object> updateManufacture(
      int id, String name, String email) async {
    try {
      var url = Uri.parse(MANUFACTURES_LIST + '/$id');
      var response = await http.put(
        url,
        body: {'name': name, 'email': email},
      );

      if (response.statusCode == 200) {
        final data = Manufacture.fromJson(jsonDecode(response.body));
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

  static Future<Object> deleteManufacture(int id) async {
    try {
      var url = Uri.parse(MANUFACTURES_LIST + '/$id');
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
