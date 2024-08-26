import 'package:flutter/material.dart';
import 'package:handl/Home/item_detail_modal.dart';

class OrderDetailsModal extends StatelessWidget {
  final Map<String, dynamic> order;
  final List<Map<String, String>> orderItems;

  const OrderDetailsModal({
    super.key,
    required this.order,
    required this.orderItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0), // Rounded top corners
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
                alignment: Alignment.center, // Centers the text
                children: [
                  Center(
                    child: Text(
                      order['orderNumber'],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
          const SizedBox(height: 10),
          Text('Status: ${order['status']}'),
          const SizedBox(height: 20),
          _buildOrderItemsList(context, orderItems), // Build order items list
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add functionality to modify the order here
                  Navigator.pop(context);
                },
                child: const Text('Modify Order'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to delete the order here
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 6, 6, 6),
                    backgroundColor: Colors.red.shade300),
                child: const Text('Delete Order'),
              ),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // Method to build the list of order items
  Widget _buildOrderItemsList(
      BuildContext context, List<Map<String, String>> orderItems) {
    return Column(
      children: orderItems.map((item) {
        final itemName = item.keys.first;
        final itemQuantity = item[itemName];
        return ListTile(
          title: Text(itemName),
          trailing: SizedBox(
            width: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Quantity: $itemQuantity'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.teal.shade300,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Show the modal when the button is pressed
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      builder: (_) => ItemDetailModal(
                        itemName: itemName,
                        itemQuantity: int.parse(itemQuantity ?? '0'),
                      ),
                    );
                  },
                  child: const Icon(Icons.checklist_sharp),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
