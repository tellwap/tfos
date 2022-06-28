import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tfos/auth/models/api_response.dart';
import 'package:tfos/models/cart.dart';
import 'package:tfos/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:tfos/utils/constants.dart';

class Orders with ChangeNotifier {
  var _items = [];

  final _token;
  Orders(this._token);

  List<Order> get items {
    return [..._items];
  }

  void addOrder(List<Cart> cartProducts, double total) {
    _items.insert(
        0,
        Order(
          id: 1,
          amount: total,
          products: cartProducts,
          dateTime: DateTime.now(),
        ));

    //post to database

    notifyListeners();
  }

  Future<ApiResponse> getOrders() async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token'
      };
      final response = await http.get(
        Uri.parse(ORDERS_LIST),
        headers: headers,
      );

      // print(response.body);

      if (response.statusCode == 200) {
        //  print(response.body);
        final data = jsonDecode(response.body)
            .map((order) => Order.fromJson(order))
            .toList();
        //print(data);
        _items = data;
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

  Future<ApiResponse> getDistributorOrders() async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token'
      };
      final response = await http.get(
        Uri.parse(ORDER_DISTRIBUTOR_LIST),
        headers: headers,
      );

      // print(response.body);

      if (response.statusCode == 200) {
        //  print(response.body);
        final data = jsonDecode(response.body)
            .map((order) => Order.fromJson(order))
            .toList();
        //print(data);
        _items = data;
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

  Future<ApiResponse> getRetailerOrders() async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token'
      };
      final response = await http.get(
        Uri.parse(ORDER_RETAILER_LIST),
        headers: headers,
      );

      // print(response.body);

      if (response.statusCode == 200) {
        //  print(response.body);
        final data = jsonDecode(response.body)
            .map((order) => Order.fromJson(order))
            .toList();
        //print(data);
        _items = data;
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

  Future<ApiResponse> createOrder(List<Cart> cartProducts, double total) async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token'
      };
      final response = await http.post(
        Uri.parse(ORDERS_LIST),
        body: jsonEncode({
          'retailer_id': '1',
          'approved': '0',
          'status': '0',
          'total_amount': total,
          'order_items': cartProducts
              .map((cartProduct) => {
                    'product_id': cartProduct.productId,
                    'quantity': cartProduct.quantity,
                  })
              .toList()

          // 'results': quizResult.results
          //     .map((result) => {'answer': '${result.answer}'})
          //     .toList()
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

  Future<ApiResponse> updateOrder(int orderId) async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token'
      };
      final response = await http.put(
        Uri.parse(ORDERS_LIST + '/$orderId'),
        body: jsonEncode({
          'status': '1',
          'approved': '1',
        }),
        headers: headers,
      );

      print(response.body);

      if (response.statusCode == 200) {
        getOrders();
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

  Future<ApiResponse> assignOrder(int orderId, int distributorId) async {
    ApiResponse _apiResponse = ApiResponse();
    try {
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $_token'
      };
      final response = await http.post(
        Uri.parse(ORDERS_LIST + '/assign'),
        body: jsonEncode({
          'order_id': orderId,
          'distributor_id': distributorId,
        }),
        headers: headers,
      );

      print(response.body);

      if (response.statusCode == 200) {
        getOrders();
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
