import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jewelleryshopapp/selection.dart';
import 'cartpage.dart';
import 'menu.dart';
import 'myorderr.dart';

class Offer extends StatefulWidget {
  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  int _carouselIndex = 0;
  int _navIndex = 0;
  int _cartCount = 2;

  final List<String> _cartItems = [
    "Elegant Necklace",
    "Stylish Bangles"
  ];

  final List<String> _imagePaths = [
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img5.jpg',
  ];

  final List<Map<String, String>> _gridItems = [
    {'image': 'assets/images/img4.jpg', 'description': 'Beautiful Necklace'},
    {'image': 'assets/images/img6.jpg', 'description': 'Elegant Necklace'},
    {'image': 'assets/images/img3.jpg', 'description': 'Stylish Necklace'},
    {'image': 'assets/images/img10.jpg', 'description': 'Stylish Necklace'},
  ];

  final Color gold = const Color(0xFFB8860B);
  final Color darkBg = const Color(0xFF1A1A1A);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        _carouselIndex = (_carouselIndex + 1) % _imagePaths.length;
      });
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _navIndex = index;
    });

    switch (index) {
      case 0:
        break; // Stay on this page
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartPage(cartItems: _cartItems),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuPage()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Menu clicked! (Add your own page)")),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Select()),
        );
        break;
    }
  }

  BottomNavigationBarItem buildCartNavItem() {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          const Icon(Icons.shopping_cart),
          if (_cartCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '$_cartCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
      label: 'Cart',
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: gold,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Welcome", style: TextStyle(color: Colors.black, fontSize: 18)),
            Text("Abdulrehman", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.black, // Set drawer background to black
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: gold),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Abdulrehman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'abdul@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Profile Clicked")));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.white),
              title: Text('My Orders', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersPage()),
                );
              },

            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Settings Clicked")));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged out")));
              },
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: darkBg,
        selectedItemColor: gold,
        unselectedItemColor: Colors.grey[500],
        currentIndex: _navIndex,
        onTap: _onNavItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          buildCartNavItem(),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Necklaces'),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Special Offers!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: gold)),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _imagePaths.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  return AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: Stack(
                      key: ValueKey<int>(_carouselIndex),
                      children: [
                        Container(
                          width: screenWidth * 0.85,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(2, 4)),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            _imagePaths[_carouselIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("50% off",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text("With code: creativemind",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text("More Interested",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: gold)),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: _gridItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(2, 4)),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              _gridItems[index]['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            _gridItems[index]['description']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
