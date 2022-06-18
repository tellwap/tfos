import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tfos/auth/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:tfos/models/purchase.dart';
import 'package:tfos/utils/constants.dart';

class Stocks with ChangeNotifier {
  Future<ApiResponse> updateStock(List<Purchase> purchaseProducts) async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $_token'
      };
      final response = await http.post(
        Uri.parse(PRODUCT_LIST + '/stocks'),
        body: jsonEncode({
          'manufacture_id': '1',
          'products': purchaseProducts
              .map((purchaseProduct) => {
                    'product_id': purchaseProduct.productId,
                    'quantity': purchaseProduct.quantity,
                  })
              .toList()
        }),
        headers: headers,
      );

      print(response.body);

      if (response.statusCode == 200) {
        print(response);
        //update provider items
        notifyListeners();
      } else {
        _apiResponse.error = somethingWentWrong;
      }
    } catch (e) {
      print(e);
      _apiResponse.error = serverError;
    }

    return _apiResponse;
  }
}
