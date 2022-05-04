import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/carts.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/widgets/cart_item.dart';
import 'package:tfos/widgets/no_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Carts>(context);
    final carts = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
      ),
      bottomNavigationBar: carts.isEmpty
          ? Container(
              height: 60,
            )
          : InkWell(
              onTap: () {
                Provider.of<Orders>(context, listen: false)
                    .addOrder(cart.items.values.toList(), cart.totalAmount);
                //clear cart item
                cart.clear();
              },
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                child: Consumer<Carts>(
                  builder: (ctx, cart, ch) => Center(
                      child: Text(
                    'Tsh ${cart.totalAmount} Check Out',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
      body: Builder(builder: (context) {
        if (carts.isEmpty) {
          return const NoItem(message: 'No item added to cart.');
        }
        return ListView.builder(
            itemCount: carts.length,
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: carts.values.toList()[index],
                  child: const CartItem(),
                ));
      }),
    );
  }
}
