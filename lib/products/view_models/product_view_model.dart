import 'package:flutter/foundation.dart';
import 'package:tfos/products/models/api_status.dart';
import 'package:tfos/products/models/product.dart';
import 'package:tfos/products/models/product_error.dart';
import 'package:tfos/products/repo/product_services.dart';

class ProductViewModel extends ChangeNotifier {
  ProductViewModel() {
    getProducts();
  }

  bool _loading = false;
  var _products = [];
  ProductError? _productError;
  Product? _selectedProduct;

  bool get loading => _loading;
  List<Product> get products => [..._products];
  ProductError? get productError => _productError;
  Product? get selectedProduct => _selectedProduct;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setProducts(List<dynamic> products) {
    _products = products;
  }

  addProducts(Product product) {
    _products.insert(0, product);
  }

  setProductError(ProductError productError) {
    _productError = productError;
  }

  setSelectedProduct(Product product) {
    _selectedProduct = product;
  }

  getProducts() async {
    setLoading(true);
    var response = await ProductServices.getProducts();
    if (response is Success) {
      setProducts(response.response as List<dynamic>);
    }
    if (response is Failure) {
      final productError = ProductError(
          code: response.code, message: response.errorResponse.toString());
      setProductError(productError);
    }
    setLoading(false);
  }

  createProducts(Product product) async {
    setLoading(true);
    var response = await ProductServices.createProduct(product);
    if (response is Success) {
      addProducts(response.response as Product);
    }
    if (response is Failure) {
      final productError = ProductError(
          code: response.code, message: response.errorResponse.toString());
      setProductError(productError);
    }
    setLoading(false);
  }

  updateProduct(int id, Product product) async {
    setLoading(true);
    var response = await ProductServices.updateProduct(id, product);
    if (response is Success) {
      _products.removeWhere((product) => product.id == id);
      addProducts(response.response as Product);
      setSelectedProduct(response.response as Product);
    }
    if (response is Failure) {
      final productError = ProductError(
          code: response.code, message: response.errorResponse.toString());
      setProductError(productError);
    }
    setLoading(false);
  }

  deleteProduct(int id) async {
    setLoading(true);
    var response = await ProductServices.deleteProduct(id);
    if (response is Success) {
      print('deleted');
      _products.removeWhere((product) => product.id == id);
      //addProducts(response.response as Product);
    }
    if (response is Failure) {
      final productError = ProductError(
          code: response.code, message: response.errorResponse.toString());
      setProductError(productError);
    }
    setLoading(false);
  }
}
