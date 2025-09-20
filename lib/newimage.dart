import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
   String imagePath;
   String itemname;
   String itemde;
   String itempri;

  ImageDetailPage({
    Key? key,
    required this.imagePath,
    required this.itemname,
    required this.itemde,
    required this.itempri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          itemname,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 220,
                  width: 320,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              itemname,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              itemde,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              "Price: $itempri",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Total: $itempri",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            // Add to Cart functionality here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$itemname added to cart!')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.symmetric(vertical: 15),

          ),
          child: Text(
            "Add to Cart",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
