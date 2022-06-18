import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tfos/distributors/models/api_status.dart';
import 'package:tfos/distributors/models/distributor.dart';
import 'package:tfos/utils/constants.dart';

class DistributorServices {
  static Future<Object> getDistributors() async {
    try {
      var url = Uri.parse(DISTRIBUTERS_LIST);
      var response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)
            .map((distributor) => Distributor.fromJson(distributor))
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

  static Future<Object> createDistributors(
      String name, String email, String phone, String address) async {
    try {
      var url = Uri.parse(DISTRIBUTERS_LIST);
      var response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'address': address,
          'role': 'distributor',
          'password': "@distributor123",
          'password_confirmation': "@distributor123",
        },
      );
      if (response.statusCode == 201) {
        final data = Distributor.fromJson(jsonDecode(response.body));
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

  static Future<Object> updateDistributor(
      int id, String name, String email, String phone, String address) async {
    try {
      var url = Uri.parse(DISTRIBUTERS_LIST + '/$id');
      var response = await http.put(
        url,
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'address': address
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        final data = Distributor.fromJson(jsonDecode(response.body));
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

  static Future<Object> deleteDistributor(int id) async {
    try {
      var url = Uri.parse(DISTRIBUTERS_LIST + '/$id');
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
