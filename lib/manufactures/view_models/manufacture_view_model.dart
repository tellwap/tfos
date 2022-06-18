import 'package:flutter/foundation.dart';
import 'package:tfos/manufactures/models/api_status.dart';
import 'package:tfos/manufactures/models/manufacture.dart';
import 'package:tfos/manufactures/models/manufacture_error.dart';
import 'package:tfos/manufactures/repo/manufacture_services.dart';

class ManufactureViewModel extends ChangeNotifier {
  ManufactureViewModel() {
    getManufactures();
  }

  bool _loading = false;
  var _manufactures = [];
  ManufactureError? _manufactureError;
  Manufacture? _selectedManufacture;

  bool get loading => _loading;
  List<Manufacture> get manufactures => [..._manufactures];
  ManufactureError? get manufactureError => _manufactureError;
  Manufacture? get selectedManufacture => _selectedManufacture;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setManufactures(List<dynamic> manufactures) {
    _manufactures = manufactures;
  }

  addManufactures(Manufacture manufacture) {
    _manufactures.insert(0, manufacture);
  }

  setManufactureError(ManufactureError manufactureError) {
    _manufactureError = manufactureError;
  }

  setSelectedManufacture(Manufacture manufacture) {
    _selectedManufacture = manufacture;
  }

  getManufactures() async {
    setLoading(true);
    var response = await ManufactureServices.getManufactures();
    if (response is Success) {
      setManufactures(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final manufactureError = ManufactureError(
          code: response.code, message: response.errorResponse.toString());
      setManufactureError(manufactureError);
    }
    setLoading(false);
  }

  createManufactures(String name, String email, String phone, String address,
      String password) async {
    setLoading(true);
    var response = await ManufactureServices.createManufactures(
        name, email, phone, address, password);
    if (response is Success) {
      addManufactures(response.response as Manufacture);
    }
    if (response is Failure) {
      final manufactureError = ManufactureError(
          code: response.code, message: response.errorResponse.toString());
      setManufactureError(manufactureError);
    }
    setLoading(false);
  }

  updateManufacture(int id, String name, String email) async {
    setLoading(true);
    var response = await ManufactureServices.updateManufacture(id, name, email);
    if (response is Success) {
      _manufactures.removeWhere((manufacture) => manufacture.id == id);
      addManufactures(response.response as Manufacture);
      setSelectedManufacture(response.response as Manufacture);
    }
    if (response is Failure) {
      final manufactureError = ManufactureError(
          code: response.code, message: response.errorResponse.toString());
      setManufactureError(manufactureError);
    }
    setLoading(false);
  }

  deleteManufacture(int id) async {
    setLoading(true);
    var response = await ManufactureServices.deleteManufacture(id);
    if (response is Success) {
      print('deleted');
      _manufactures.removeWhere((manufacture) => manufacture.id == id);
      //addManufactures(response.response as Manufacture);
    }
    if (response is Failure) {
      final manufactureError = ManufactureError(
          code: response.code, message: response.errorResponse.toString());
      setManufactureError(manufactureError);
    }
    setLoading(false);
  }
}
