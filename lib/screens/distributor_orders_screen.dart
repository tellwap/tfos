import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/widgets/distributor_order_item.dart';
import 'package:tfos/widgets/no_item.dart';

class DistributorOrdersScreen extends StatefulWidget {
  const DistributorOrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/distributor-orders-screen';

  @override
  State<DistributorOrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<DistributorOrdersScreen> {
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
    await Provider.of<Orders>(context).getDistributorOrders();
  }

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
          itemBuilder: (ctx, index) =>
              DistributorOrderItem(order: orders[index]),
        );
      }),
    );
  }
}
