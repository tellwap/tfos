import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/widgets/no_item.dart';
import 'package:tfos/widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orders-screen';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      getOrder();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void getOrder() async {
    await Provider.of<Orders>(context).getRetailerOrders();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My orders'),
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
