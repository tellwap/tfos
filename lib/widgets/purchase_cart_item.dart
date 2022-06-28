import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfos/models/purchase.dart';
import 'package:tfos/utils/constants.dart';

class PurchaseCartItem extends StatelessWidget {
  const PurchaseCartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Purchase>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      // color: Colors.green,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey,
              // borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('$baseImageURL${cart.image}'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Text('description'),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                cart.decreaseQuantity();
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 25,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              cart.quantity.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                cart.increaseQuantity();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
