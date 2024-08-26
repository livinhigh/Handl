import 'package:flutter/material.dart';

class ItemDetailModal extends StatefulWidget {
  final String itemName;
  final int itemQuantity;

  const ItemDetailModal({
    super.key,
    required this.itemName,
    required this.itemQuantity,
  });

  @override
  State<ItemDetailModal> createState() => _ItemDetailModalState();
}

class _ItemDetailModalState extends State<ItemDetailModal> {
  int _deliveredQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.itemName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_deliveredQuantity > 0) _deliveredQuantity--;
                  });
                },
                icon: const Icon(Icons.remove),
              ),
              Text(
                _deliveredQuantity.toString(),
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (_deliveredQuantity < widget.itemQuantity) {
                      _deliveredQuantity++;
                    }
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Logic to mark all items as delivered
                  setState(() {
                    _deliveredQuantity = widget.itemQuantity;
                  });
                },
                child: const Text('Mark All'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Logic to mark selected items as delivered
                  Navigator.pop(context);
                },
                child: const Text('Mark Selected'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
