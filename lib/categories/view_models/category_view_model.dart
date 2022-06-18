import 'package:flutter/foundation.dart';
import 'package:tfos/categories/models/api_status.dart';
import 'package:tfos/categories/models/category_error.dart';
import 'package:tfos/categories/repo/category_services.dart';
import 'package:tfos/categories/models/category.dart' as category;

class CategoryViewModel extends ChangeNotifier {
  CategoryViewModel() {
    getCategories();
  }

  bool _loading = false;
  var _categories = [];
  CategoryError? _categoryError;
  category.Category? _selectedCategory;

  bool get loading => _loading;
  List<category.Category> get categories => [..._categories];
  CategoryError? get categoryError => _categoryError;
  category.Category? get selectedCategory => _selectedCategory;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCategories(List<dynamic> categories) {
    _categories = categories;
  }

  addCategory(category.Category category) {
    _categories.insert(0, category);
  }

  setCategoryError(CategoryError categoryError) {
    _categoryError = categoryError;
  }

  setSelectedCategory(category.Category category) {
    _selectedCategory = category;
  }

  getCategories() async {
    setLoading(true);
    print('****** ');

    var response = await CategoriesServices.getCategories();
    print(response);
    if (response is Success) {
      print('****** ${response.code}');
      setCategories(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final categoryError = CategoryError(
          code: response.code, message: response.errorResponse.toString());
      setCategoryError(categoryError);
    }
    setLoading(false);
  }

  createCategory(String name, String details) async {
    setLoading(true);
    var response = await CategoriesServices.createCategory(name, details);
    if (response is Success) {
      addCategory(response.response as category.Category);
    }
    if (response is Failure) {
      final categoryError = CategoryError(
          code: response.code, message: response.errorResponse.toString());
      setCategoryError(categoryError);
    }
    setLoading(false);
  }

  updateCategory(int id, String name, String details) async {
    setLoading(true);
    var response = await CategoriesServices.updateCategory(id, name, details);
    if (response is Success) {
      _categories.removeWhere((category) => category.id == id);
      addCategory(response.response as category.Category);
      setSelectedCategory(response.response as category.Category);
    }
    if (response is Failure) {
      final categoryError = CategoryError(
          code: response.code, message: response.errorResponse.toString());
      setCategoryError(categoryError);
    }
    setLoading(false);
  }

  deleteCategory(int id) async {
    setLoading(true);
    var response = await CategoriesServices.deleteCategory(id);
    if (response is Success) {
      print('deleted');
      _categories.removeWhere((category) => category.id == id);
      //addUnits(response.response as Unit);
    }
    if (response is Failure) {
      final categoryError = CategoryError(
          code: response.code, message: response.errorResponse.toString());
      setCategoryError(categoryError);
    }
    setLoading(false);
  }
}
