import 'package:flutter/material.dart';
import 'package:handl/DummyData/dummyorder.dart';
import 'package:handl/Home/order_card.dart';
import 'package:handl/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Welcome User!',
              style: TextStyle(fontSize: 24),
            ),
            _buildTopContainer(
                context,
                DummyOrders().orders,
                DummyOrders()
                    .orderDetails), // Top container with order information

            const SizedBox(height: 20), // Add space between the text and button
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Distributes buttons equally
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 200), // Square shape
                    backgroundColor: Colors.teal.shade200, // Light teal color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly rounded corners
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          "Catalogue\nEditor"),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 200), // Square shape
                    backgroundColor: Colors.red.shade300, // Flat red color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly rounded corners
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          "Settings"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add space between the text and button
            SizedBox(
              width: 150, // Set the desired width
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300, // Flat red color
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, AppRoutes.login);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                        width: 5), // Optional spacing between icon and text
                    Text('Logout'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          print('Create new KOT');
        },
        tooltip: 'Add',
        child: const Icon(Icons.add, color: Colors.teal),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildTopContainer(
      BuildContext context,
      List<Map<String, dynamic>> orders,
      Map<String, List<Map<String, String>>> orderItems) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: orders
            .map((order) => OrderCard(order: order, orderitems: orderItems))
            .toList(),
      ),
    );
  }
}
