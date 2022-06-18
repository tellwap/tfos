import 'package:flutter/foundation.dart';
import 'package:tfos/distributors/models/api_status.dart';
import 'package:tfos/distributors/models/distributor.dart';
import 'package:tfos/distributors/models/distributor_error.dart';
import 'package:tfos/distributors/repo/distributor_services.dart';

class DistributorViewModel extends ChangeNotifier {
  DistributorViewModel() {
    getDistributors();
  }

  bool _loading = false;
  var _distributors = [];
  DistributorError? _distributorError;
  Distributor? _selectedDistributor;

  bool get loading => _loading;
  List<Distributor> get distributors => [..._distributors];
  DistributorError? get distributorError => _distributorError;
  Distributor? get selectedDistributor => _selectedDistributor;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setDistributors(List<dynamic> distributors) {
    _distributors = distributors;
  }

  addDistributors(Distributor distributor) {
    _distributors.insert(0, distributor);
  }

  setDistributorError(DistributorError distributorError) {
    _distributorError = distributorError;
  }

  setSelectedDistributor(Distributor distributor) {
    _selectedDistributor = distributor;
  }

  getDistributors() async {
    setLoading(true);
    var response = await DistributorServices.getDistributors();
    if (response is Success) {
      setDistributors(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final distributorError = DistributorError(
          code: response.code, message: response.errorResponse.toString());
      setDistributorError(distributorError);
    }
    setLoading(false);
  }

  createDistributors(
      String name, String email, String phone, String address) async {
    setLoading(true);
    var response = await DistributorServices.createDistributors(
        name, email, phone, address);
    if (response is Success) {
      addDistributors(response.response as Distributor);
    }
    if (response is Failure) {
      final distributorError = DistributorError(
          code: response.code, message: response.errorResponse.toString());
      setDistributorError(distributorError);
    }
    setLoading(false);
  }

  updateDistributor(int id, String name, String email, String phoneNumber,
      String address) async {
    setLoading(true);
    var response = await DistributorServices.updateDistributor(
        id, name, email, phoneNumber, address);
    if (response is Success) {
      _distributors.removeWhere((distributor) => distributor.id == id);
      addDistributors(response.response as Distributor);
      setSelectedDistributor(response.response as Distributor);
    }
    if (response is Failure) {
      final distributorError = DistributorError(
          code: response.code, message: response.errorResponse.toString());
      setDistributorError(distributorError);
    }
    setLoading(false);
  }

  deleteDistributor(int id) async {
    setLoading(true);
    var response = await DistributorServices.deleteDistributor(id);
    if (response is Success) {
      print('deleted');
      _distributors.removeWhere((distributor) => distributor.id == id);
      //addDistributors(response.response as Distributor);
    }
    if (response is Failure) {
      final distributorError = DistributorError(
          code: response.code, message: response.errorResponse.toString());
      setDistributorError(distributorError);
    }
    setLoading(false);
  }
}
