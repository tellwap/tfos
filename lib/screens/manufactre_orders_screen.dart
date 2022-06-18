import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/widgets/manufacture_order_item.dart';
import 'package:tfos/widgets/no_item.dart';

class ManufactureOrdersScreen extends StatefulWidget {
  const ManufactureOrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/manufacture-orders-screen';

  @override
  State<ManufactureOrdersScreen> createState() =>
      _ManufactureOrdersScreenState();
}

class _ManufactureOrdersScreenState extends State<ManufactureOrdersScreen> {
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
    await Provider.of<Orders>(context).getOrders();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Builder(builder: (context) {
        if (orders.isEmpty) {
          return const NoItem(message: 'No order available');
        }
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (ctx, index) =>
              ManufactureOrderItem(order: orders[index]),
        );
      }),
    );
  }
}
