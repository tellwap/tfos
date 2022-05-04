import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/widgets/no_item.dart';
import 'package:tfos/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      body: Builder(builder: (context) {
        if (orders.isEmpty) {
          return const NoItem(message: 'No order available');
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (ctx, index) => OrderItem(order: orders[index]),
        );
      }),
    );
  }
}
