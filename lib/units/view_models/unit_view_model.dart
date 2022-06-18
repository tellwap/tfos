import 'package:flutter/foundation.dart';
import 'package:tfos/units/models/api_status.dart';
import 'package:tfos/units/models/unit.dart';
import 'package:tfos/units/models/unit_error.dart';
import 'package:tfos/units/repo/unit_services.dart';

class UnitViewModel extends ChangeNotifier {
  UnitViewModel() {
    getUnits();
  }

  bool _loading = false;
  var _units = [];
  UnitError? _unitError;
  Unit? _selectedUnit;

  bool get loading => _loading;
  List<Unit> get units => [..._units];
  UnitError? get unitError => _unitError;
  Unit? get selectedUnit => _selectedUnit;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUnits(List<dynamic> units) {
    _units = units;
  }

  addUnits(Unit unit) {
    _units.insert(0, unit);
  }

  setUnitError(UnitError unitError) {
    _unitError = unitError;
  }

  setSelectedUnit(Unit unit) {
    _selectedUnit = unit;
  }

  getUnits() async {
    setLoading(true);
    var response = await UnitServices.getUnits();
    if (response is Success) {
      setUnits(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final unitError = UnitError(
          code: response.code, message: response.errorResponse.toString());
      setUnitError(unitError);
    }
    setLoading(false);
  }

  createUnits(String name, String details) async {
    setLoading(true);
    var response = await UnitServices.createUnits(name, details);
    if (response is Success) {
      addUnits(response.response as Unit);
    }
    if (response is Failure) {
      final unitError = UnitError(
          code: response.code, message: response.errorResponse.toString());
      setUnitError(unitError);
    }
    setLoading(false);
  }

  updateUnit(int id, String name, String details) async {
    setLoading(true);
    var response = await UnitServices.updateUnit(id, name, details);
    if (response is Success) {
      _units.removeWhere((unit) => unit.id == id);
      addUnits(response.response as Unit);
      setSelectedUnit(response.response as Unit);
    }
    if (response is Failure) {
      final unitError = UnitError(
          code: response.code, message: response.errorResponse.toString());
      setUnitError(unitError);
    }
    setLoading(false);
  }

  deleteUnit(int id) async {
    setLoading(true);
    var response = await UnitServices.deleteUnit(id);
    if (response is Success) {
      print('deleted');
      _units.removeWhere((unit) => unit.id == id);
      //addUnits(response.response as Unit);
    }
    if (response is Failure) {
      final unitError = UnitError(
          code: response.code, message: response.errorResponse.toString());
      setUnitError(unitError);
    }
    setLoading(false);
  }
}
