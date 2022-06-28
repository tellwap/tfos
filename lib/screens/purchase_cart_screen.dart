import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/providers/carts.dart';
import 'package:tfos/providers/purchases.dart';
import 'package:tfos/providers/stocks.dart';
import 'package:tfos/widgets/no_item.dart';
import 'package:tfos/widgets/purchase_cart_item.dart';

class PurchaseCartScreen extends StatelessWidget {
  const PurchaseCartScreen({Key? key}) : super(key: key);
  static const routeName = '/purchase-cart-screnn';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Purchases>(context);
    final carts = cart.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Stock'),
      ),
      bottomNavigationBar: carts.isEmpty
          ? Container(
              height: 60,
            )
          : InkWell(
              onTap: () async {
                final response =
                    await Provider.of<Stocks>(context, listen: false)
                        .updateStock(cart.items.values.toList());

                print(response.data);
                //clear cart item
                //  print(cart.items.values.toList());
                cart.clear();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Stock updated successfully')));
              },
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                child: Consumer<Carts>(
                  builder: (ctx, cart, ch) => const Center(
                      child: Text(
                    'Update Stock',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ),
      body: Builder(builder: (context) {
        if (carts.isEmpty) {
          return const NoItem(message: 'No item.');
        }
        return ListView.builder(
            itemCount: carts.length,
            itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                  value: carts.values.toList()[index],
                  child: const PurchaseCartItem(),
                ));
      }),
    );
  }
}
