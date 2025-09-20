import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String item;
  final Function(String) onAddToCart;

  const DetailPage({super.key, required this.item, required this.onAddToCart});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Color gold = const Color(0xFFFFD700); // brighter gold
  final Color black = const Color(0xFF000000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: Text(
          widget.item,
          style: TextStyle(color: gold, fontWeight: FontWeight.bold),
        ),
        backgroundColor: black,
        iconTheme: IconThemeData(color: gold),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, color: gold, size: 80),
            const SizedBox(height: 20),
            Text(
              widget.item,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: gold,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                widget.onAddToCart(widget.item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Added "${widget.item}" to cart',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: gold,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: Icon(Icons.add_shopping_cart, color: black),
              label: Text(
                'Add to Cart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: gold,
                foregroundColor: black,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
