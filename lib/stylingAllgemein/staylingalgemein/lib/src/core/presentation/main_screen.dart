import 'package:flutter/material.dart';
import 'package:snack_app/src/core/presentation/product_details.dart';
import 'package:snack_app/src/core/presentation/product_deteil_screen.dart';
import 'dart:ui';

// Glavna klasa za prikazivanje glavnog ekrana aplikacije
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

// Stanje glavnog ekrana
class _MainScreenState extends State<MainScreen> {
  // Trenutno odabrana kategorija
  String selectedCategory = 'Salty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Pozadinska slika koja ispunjava cijeli ekran
          Positioned.fill(
            child: Image.asset(
              'assets/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          // Glavni sadržaj unutar ScrollView-a
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    // Tekstualni naslovi
                    const Text(
                      'Choose Your Favorite',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Snack',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Horizontalni ScrollView za kategorije
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // Dugme za kategoriju "All categories"
                          _buildBlurredCategoryButton(
                            label: 'All categories',
                            selected: selectedCategory == 'All categories',
                            onSelected: () {
                              setState(() {
                                selectedCategory = 'All categories';
                              });
                            },
                            icon: Icons.fastfood,
                          ),
                          const SizedBox(width: 5),
                          // Dugme za kategoriju "Salty"
                          _buildBlurredCategoryButton(
                            label: 'Salty',
                            selected: selectedCategory == 'Salty',
                            onSelected: () {
                              setState(() {
                                selectedCategory = 'Salty';
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          // Dugme za kategoriju "Sweet"
                          _buildBlurredCategoryButton(
                            label: 'Sweet',
                            selected: selectedCategory == 'Sweet',
                            onSelected: () {
                              setState(() {
                                selectedCategory = 'Sweet';
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          // Dugme za kategoriju "Cold"
                          _buildBlurredCategoryButton(
                            label: 'Cold',
                            selected: selectedCategory == 'Cold',
                            onSelected: () {
                              setState(() {
                                selectedCategory = 'Cold';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        height: 30), //spustit ce se sve kartice sem kategorija
                    // Kartica s preporučenim proizvodom
                    Stack(
                      children: [
                        Image.asset(
                          'assets/Top_Card.png',
                          width: MediaQuery.of(context).size.width *
                              0.9, // kartica angi burger ce nestati ako smanjim
                          fit: BoxFit.cover,
                        ),
                        // Pozicionirani tekstualni opisi i dugme unutar kartice
                        Positioned(
                          top: 16,
                          left: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Angi's Yummy Burger",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Delish vegan burger that tastes like heaven',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'A 13.99',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Dugme za dodavanje u narudžbu
                              Container(
                                margin: const EdgeInsets.only(top: 40.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(190, 115, 224, 1),
                                      Color.fromRGBO(147, 140, 236, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      10), // dugme add to order obrub
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(198, 161, 242, 1),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.purple.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13,
                                        vertical:
                                            10), //velicina dugmeta add to order
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'Add to order',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Ocjena proizvoda
                        const Positioned(
                          right: 30,
                          top: 16,
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  color: Color.fromRGBO(224, 138, 178, 1),
                                  size: 16),
                              SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Slika burgera
                        Positioned(
                          right: -10,
                          top: 60,
                          child: Image.asset(
                            'assets/Burger_3D.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Naslov za preporuke
                    const Text(
                      'We Recommend',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Horizontalni ScrollView za preporučene proizvode
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // Preporučena kartica za "Mogli's Cup"
                          RecommendationCard(
                            image: 'assets/cat_cupcakes_3D.png',
                            title: "Mogli's Cup",
                            description: 'Strawberry ice cream',
                            price: 'A 8.99',
                            likes: '200',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductDetailScreenNew()),
                              );
                            },
                          ),
                          // Preporučena kartica za "Balu's Cup"
                          RecommendationCard(
                            image: 'assets/Ice.cream.png',
                            title: "Balu's Cup",
                            description: 'Pistachio ice cream',
                            price: 'A 8.99',
                            likes: '100',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductDetailScreen()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 17),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Metoda za kreiranje dugmeta s mutnim efektom za kategorije
  Widget _buildBlurredCategoryButton({
    required String label,
    required bool selected,
    required VoidCallback onSelected,
    IconData? icon,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color:
                selected ? Colors.white : const Color.fromRGBO(55, 61, 59, 0.5),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: selected ? Colors.white : Colors.grey),
                const SizedBox(width: 4),
              ],
              GestureDetector(
                onTap: onSelected,
                child: Text(
                  label,
                  style: TextStyle(
                    color: selected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Klasa za preporučene kartice proizvoda
class RecommendationCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final String likes;
  final VoidCallback onPressed;

  const RecommendationCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.likes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 192,
        height: 264,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(89, 88, 92, 1),
              Color.fromRGBO(119, 117, 189, 1),
              Color.fromRGBO(118, 86, 183, 1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 120,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      likes,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
