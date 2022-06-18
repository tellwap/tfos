import 'package:tfos/models/cart.dart';
import 'package:tfos/models/order_item.dart';

class Order {
  final int id;
  double? amount;
  List<Cart>? products;
  DateTime? dateTime;

  int? approved;
  int? status;
  int? totalAmount;
  List<OrderItem>? orderItems;
  String? createdAt;

  Order(
      {required this.id,
      this.amount,
      this.products,
      this.dateTime,
      this.approved,
      this.status,
      this.totalAmount,
      this.orderItems,
      this.createdAt});

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['order_items'] as List;
    print(list);
    var orderItemList =
        list.map((orderItem) => OrderItem.fromJson(orderItem)).toList();
    return Order(
        id: json['id'],
        approved: json['approved'],
        status: json['status'],
        totalAmount: json['total_amount'],
        orderItems: orderItemList,
        createdAt: json['created_at']);
  }
}
