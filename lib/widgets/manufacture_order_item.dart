import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tfos/models/order.dart';
import 'package:tfos/providers/orders.dart';
import 'package:tfos/screens/assign_order_distributor_screen.dart';

class ManufactureOrderItem extends StatefulWidget {
  final Order order;
  const ManufactureOrderItem({Key? key, required this.order}) : super(key: key);

  @override
  State<ManufactureOrderItem> createState() => _ManufactureOrderItemState();
}

class _ManufactureOrderItemState extends State<ManufactureOrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamed(
                  context, AssignOrderDistributorScreen.routeName,
                  arguments: widget.order.id);
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ORDER NO: ${widget.order.id}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'TZS ${widget.order.totalAmount}',
                  style: const TextStyle(fontSize: 20),
                ),
                widget.order.approved == 1
                    ? Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text('Completed'))
                    : ElevatedButton(
                        onPressed: () async {
                          await Provider.of<Orders>(context, listen: false)
                              .updateOrder(widget.order.id);
                          print(widget.order.id);
                        },
                        child: const Text('Confirm')),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('ORDER TO: '),
                            Text(
                              widget.order.retailer!.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('PHONE NUMBER: '),
                            Text(
                              widget.order.retailer!.phoneNumber,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('ADDRESS: '),
                            Expanded(
                              child: Text(
                                widget.order.retailer!.address,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Divider()
                      ],
                    ))
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  DateFormat('dd MM yyyy hh:mm').format(
                      DateTime.parse(widget.order.createdAt.toString())),
                ),
              ],
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: min(widget.order.orderItems!.length * 20.0 + 30, 180),
              child: ListView.builder(
                itemCount: widget.order.orderItems?.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.order.orderItems![index].product.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.order.orderItems?[index].quantity} ${widget.order.orderItems?[index].product.unit!.name} X ${widget.order.orderItems?[index].product.price}',
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
