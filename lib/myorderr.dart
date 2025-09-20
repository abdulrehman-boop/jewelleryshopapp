import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      'image': 'assets/images/img3.jpg',
      'title': 'Elegant Gold Necklace',
      'status': 'Delivered',
      'date': '12 July 2025',
    },
    {
      'image': 'assets/images/img6.jpg',
      'title': 'Stylish Diamond Ring',
      'status': 'Shipped',
      'date': '15 July 2025',
    },
    {
      'image': 'assets/images/img10.jpg',
      'title': 'Classic Bangles Set',
      'status': 'Processing',
      'date': '17 July 2025',
    },
  ];

  final Color gold = const Color(0xFFB8860B);
  final Color darkBg = const Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: gold,
        title: const Text('My Orders', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                )
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  order['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(order['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text("Status: ${order['status']}", style: const TextStyle(color: Colors.black87)),
                  Text("Date: ${order['date']}", style: const TextStyle(color: Colors.grey)),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[600],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Viewing details for ${order['title']}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
