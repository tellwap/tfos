import 'package:flutter/foundation.dart';
import 'package:tfos/areas/models/api_status.dart';
import 'package:tfos/areas/models/area.dart';
import 'package:tfos/areas/models/area_error.dart';
import 'package:tfos/areas/repo/area_services.dart';

class AreaViewModel extends ChangeNotifier {
  AreaViewModel() {
    getAreas();
  }

  bool _loading = false;
  var _items = [];
  AreaError? _areaError;
  Area? _selectedArea;

  bool get loading => _loading;
  List<Area> get items => [..._items];
  AreaError? get areaError => _areaError;
  Area? get selectedArea => _selectedArea;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setAreas(List<dynamic> areas) {
    _items = areas;
  }

  addArea(Area area) {
    _items.insert(0, area);
  }

  setAreaError(AreaError areaError) {
    _areaError = areaError;
  }

  setSelectedArea(Area area) {
    _selectedArea = area;
  }

  getAreas() async {
    setLoading(true);
    var response = await AreaServices.getAreas();
    if (response is Success) {
      setAreas(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final areaErrror = AreaError(
          code: response.code, message: response.errorResponse.toString());
      setAreaError(areaErrror);
    }
    setLoading(false);
  }

  createArea(String name, String code) async {
    setLoading(true);
    var response = await AreaServices.createArea(name, code);
    if (response is Success) {
      addArea(response.response as Area);
    }
    if (response is Failure) {
      final areaError = AreaError(
          code: response.code, message: response.errorResponse.toString());
      setAreaError(areaError);
    }
    setLoading(false);
  }

  updateArea(int id, String name, String code) async {
    setLoading(true);
    var response = await AreaServices.updateArea(id, name, code);
    if (response is Success) {
      _items.removeWhere((area) => area.id == id);
      addArea(response.response as Area);
      setSelectedArea(response.response as Area);
    }
    if (response is Failure) {
      final areaError = AreaError(
          code: response.code, message: response.errorResponse.toString());
      setAreaError(areaError);
    }
    setLoading(false);
  }

  deleteArea(int id) async {
    setLoading(true);
    var response = await AreaServices.deleteArea(id);
    if (response is Success) {
      print('deleted');
      _items.removeWhere((area) => area.id == id);
    }
    if (response is Failure) {
      final areaError = AreaError(
          code: response.code, message: response.errorResponse.toString());
      setAreaError(areaError);
    }
    setLoading(false);
  }
}
