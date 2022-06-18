import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tfos/units/models/api_status.dart';
import 'package:tfos/units/models/unit.dart';
import 'package:tfos/utils/constants.dart';

class StockServices {
  static Future<Object> updateUnit(int id, int quantity) async {
    try {
      var url = Uri.parse(UNITS_LIST + '/$id');
      var response = await http.put(
        url,
        //body: {'name': name, 'details': details},
      );

      if (response.statusCode == 200) {
        final data = Unit.fromJson(jsonDecode(response.body));
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
}
