import 'package:flutter/material.dart';
import 'newimage.dart';

class Select extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "image": "assets/images/img3.jpg",
      "text": "Silver Necklace",
      "price": " \$180",
      "des":
      "A stylish and versatile necklace made of silver, suitable for everyday or formal wear. It comes in various designs, from simple chains to intricate patterns."
    },
    {
      "image": "assets/images/img4.jpg",
      "text": "Sapphire Pendant",
      "price": " \$200",
      "des":
      "A necklace featuring a sapphire gemstone as its centerpiece, symbolizing wisdom and royalty. Often set in gold or silver, it adds elegance to any outfit."
    },
    {
      "image": "assets/images/img5.jpg",
      "text": "Emerala Necklace",
      "price": " \$400",
      "des":
      "A luxurious necklace adorned with vibrant green emeralds, representing love and prosperity. It is often worn in statement or traditional jewelry designs."
    },
    {
      "image": "assets/images/img6.jpg",
      "text": "Pearl necklace",
      "price": " \$180",
      "des":
      "A timeless classic featuring pearls, known for their elegance and sophistication. Perfect for formal occasions, weddings, and traditional wear."
    },
    {
      "image": "assets/images/img7.jpg",
      "text": "Tennis necklace",
      "price": " \$300",
      "des":
      "A sleek and sparkling necklace with a continuous row of gemstones, typically diamonds. It offers a minimalist yet luxurious look, perfect for special occasions."
    },
    {
      "image": "assets/images/img8.jpg",
      "text": "Gold necklace",
      "price": " \$195",
      "des":
      "A traditional and elegant necklace made of gold, symbolizing wealth and prosperity. It comes in various styles, from plain chains to ornate designs."
    },
    {
      "image": "assets/images/img9.jpg",
      "text": "Lariat necklace",
      "price": " \$350",
      "des":
      "A long, open-ended necklace that drapes gracefully without a clasp. It can be styled in multiple ways, making it a versatile fashion accessory."
    },
    {
      "image": "assets/images/img10.jpg",
      "text": "Locket necklace",
      "price": " \$190",
      "des":
      "A sentimental necklace with a pendant that opens to hold small photos or keepsakes. Often given as a meaningful gift with personal significance."
    },
    {
      "image": "assets/images/img11.jpg",
      "text": "Chain necklace",
      "price": " \$290",
      "des":
      "A simple yet stylish necklace made of linked metal chains, available in various patterns like rope, curb, or figaro. It can be worn alone or with a pendant."
    },
    {
      "image": "assets/images/img12.jpg",
      "text": "Mango necklace",
      "price": " \$550",
      "des":
      "A South Indian traditional necklace with mango-shaped motifs, symbolizing fertility and prosperity. Often crafted in gold and worn for weddings and cultural events."
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
        title: const Text(
          "Necklace Collection",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailPage(
                      imagePath: items[index]["image"]!,
                      itemname: items[index]["text"]!,
                      itempri: items[index]["price"]!,
                      itemde: items[index]["des"]!,
                      // onAddToCart: (String itemName) {
                        // Handle cart add logic here
                      // },

                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          items[index]["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Text(
                            items[index]["text"]!,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            items[index]["price"]!,
                            style: TextStyle(
                                fontSize: 14,
                                color: gold,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
