import 'package:flutter/foundation.dart';
import 'package:tfos/retailers/models/api_status.dart';
import 'package:tfos/retailers/models/retailer.dart';
import 'package:tfos/retailers/models/retailer_error.dart';
import 'package:tfos/retailers/repo/retailer_services.dart';

class RetailerViewModel extends ChangeNotifier {
  RetailerViewModel() {
    getRetailers();
  }

  bool _loading = false;
  var _retailers = [];
  RetailerError? _retailerError;
  Retailer? _selectedRetailer;

  bool get loading => _loading;
  List<Retailer> get retailers => [..._retailers];
  RetailerError? get retailerError => _retailerError;
  Retailer? get selectedRetailer => _selectedRetailer;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setRetailers(List<dynamic> retailers) {
    _retailers = retailers;
  }

  addRetailers(Retailer retailer) {
    _retailers.insert(0, retailer);
  }

  setRetailerError(RetailerError retailerError) {
    _retailerError = retailerError;
  }

  setSelectedRetailer(Retailer retailer) {
    _selectedRetailer = retailer;
  }

  getRetailers() async {
    setLoading(true);
    var response = await RetailerServices.getRetailers();
    if (response is Success) {
      setRetailers(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final retailerError = RetailerError(
          code: response.code, message: response.errorResponse.toString());
      setRetailerError(retailerError);
    }
    setLoading(false);
  }

  createRetailers(
      String name, String email, String phone, String address) async {
    setLoading(true);
    var response =
        await RetailerServices.createRetailers(name, email, phone, address);
    if (response is Success) {
      addRetailers(response.response as Retailer);
    }
    if (response is Failure) {
      final retailerError = RetailerError(
          code: response.code, message: response.errorResponse.toString());
      setRetailerError(retailerError);
    }
    setLoading(false);
  }

  updateRetailer(int id, String name, String email) async {
    setLoading(true);
    var response = await RetailerServices.updateRetailer(id, name, email);
    if (response is Success) {
      _retailers.removeWhere((retailer) => retailer.id == id);
      addRetailers(response.response as Retailer);
      setSelectedRetailer(response.response as Retailer);
    }
    if (response is Failure) {
      final retailerError = RetailerError(
          code: response.code, message: response.errorResponse.toString());
      setRetailerError(retailerError);
    }
    setLoading(false);
  }

  deleteRetailer(int id) async {
    setLoading(true);
    var response = await RetailerServices.deleteRetailer(id);
    if (response is Success) {
      print('deleted');
      _retailers.removeWhere((retailer) => retailer.id == id);
      //addRetailers(response.response as Retailer);
    }
    if (response is Failure) {
      final retailerError = RetailerError(
          code: response.code, message: response.errorResponse.toString());
      setRetailerError(retailerError);
    }
    setLoading(false);
  }
}
