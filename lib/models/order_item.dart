import 'package:tfos/products/models/product.dart';

class OrderItem {
  final int id;
  final int productId;
  final int quantity;
  final Product product;

  OrderItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      product: Product.fromJson(
        json['product'],
      ),
    );
  }
}
