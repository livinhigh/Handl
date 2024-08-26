import 'package:flutter/material.dart';
import 'order_details_modal.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final Map<String, List<Map<String, String>>> orderitems;

  const OrderCard({super.key, required this.order, required this.orderitems});

  @override
  Widget build(BuildContext context) {
    Color statusColor = order['timeLeft'] >= 0 ? Colors.green : Colors.red;

    return GestureDetector(
      onTap: () {
        // Show modal bottom sheet when the container is tapped
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          isScrollControlled: true, // Allows the sheet to expand to full height
          builder: (BuildContext context) {
            List<Map<String, String>> orderItems =
                orderitems['#${order['id']}'] ?? [];
            return OrderDetailsModal(order: order, orderItems: orderItems);
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order['orderNumber'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              order['status'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
