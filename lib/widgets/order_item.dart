import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tfos/models/order.dart';

class OrderItem extends StatefulWidget {
  final Order order;
  const OrderItem({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          ListTile(
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
                Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: widget.order.approved == 1
                            ? Colors.green[100]
                            : Colors.red[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: widget.order.approved == 1
                        ? const Text('Completed')
                        : const Text('Pending'))
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
