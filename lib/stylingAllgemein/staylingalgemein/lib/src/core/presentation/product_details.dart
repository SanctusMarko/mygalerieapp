import 'dart:ui'; // Import za rad sa slikama i efektima kao što su zamućenje
import 'package:flutter/material.dart'; // Import za Flutter materijalne komponente

// Definicija glavne klase za ekran detalja proizvoda
class ProductDetailScreenNew extends StatefulWidget {
  const ProductDetailScreenNew({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

// Stanje za ekran detalja proizvoda
class _ProductDetailScreenState extends State<ProductDetailScreenNew> {
  String selectedSize = 'Large'; // Inicijalna veličina proizvoda
  int quantity = 1; // Inicijalna količina proizvoda
  double price = 8.99; // Inicijalna cena proizvoda

  // Metoda za ažuriranje cene na osnovu odabrane veličine
  void updatePrice(String size) {
    setState(() {
      selectedSize = size;
      if (size == 'Small') {
        price = 6.99;
      } else if (size == 'Medium') {
        price = 7.50;
      } else if (size == 'Large') {
        price = 8.99;
      }
    });
  }

  // Metoda za povećanje količine proizvoda
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Metoda za smanjenje količine proizvoda
  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Prikaz modala sa detaljima proizvoda kada se ekran učita
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showProductDetailModal(context);
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Pozadinska slika koja ispunjava ceo ekran
          Positioned.fill(
            child: Image.asset(
              'assets/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // Metoda za prikaz modala sa detaljima proizvoda
  void _showProductDetailModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Pozadina modala sa gradijentom
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF2E2B23), Color(0xFF373F40)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    // Slika proizvoda
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Image.asset(
                          'assets/cat_cupcakes_3D.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Dugme za zatvaranje modala
                    Positioned(
                      top: 20,
                      right: 15,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                    // Sadržaj modala
                    Positioned(
                      top: 175,
                      left: 25,
                      right: 25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 193, 170, 218),
                                  width: 0.2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.favorite_border,
                                      color: Color.fromARGB(255, 166, 155, 151),
                                      size: 15,
                                    ),
                                    Text(
                                      " 200",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Inter",
                                          color: Color.fromARGB(
                                              255, 166, 155, 151),
                                          letterSpacing: -0.5,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Mogli's Cup",
                                  style: TextStyle(
                                      fontSize: 25,
                                      letterSpacing: -0.5,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                const Text(
                                  "₳ 8.99",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 91, 87, 82),
                                  height: 40,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Ingredients',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.cake,
                                                color: Colors.white),
                                            Icon(Icons.icecream,
                                                color: Colors.white),
                                            Icon(Icons.cookie,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Reviews',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.white),
                                            Icon(Icons.star,
                                                color: Colors.white),
                                            Icon(Icons.star,
                                                color: Colors.white),
                                            Icon(Icons.star,
                                                color: Colors.white),
                                            Icon(Icons.star_border,
                                                color: Colors.white),
                                            SizedBox(width: 5),
                                            Text('4.0',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Dugmići za odabir veličine proizvoda
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildSizeButton(context, 'Small',
                                        selectedSize == 'Small', () {
                                      updatePrice('Small');
                                    }),
                                    buildSizeButton(context, 'Medium',
                                        selectedSize == 'Medium', () {
                                      updatePrice('Medium');
                                    }),
                                    buildSizeButton(context, 'Large',
                                        selectedSize == 'Large', () {
                                      updatePrice('Large');
                                    }),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Dugmići za podešavanje količine proizvoda
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildQuantityButton(context, Icons.remove,
                                        decrementQuantity),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        quantity.toString(),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    buildQuantityButton(
                                        context, Icons.add, incrementQuantity),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Dugme za dodavanje proizvoda u narudžbinu
                    Positioned(
                      bottom: 70,
                      left: 21,
                      right: 21,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Add to order for ₳ ${(price * quantity).toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  // Pomoćna metoda za kreiranje dugmeta za veličinu proizvoda
  Widget buildSizeButton(BuildContext context, String text, bool isSelected,
      VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF505050) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Pomoćna metoda za kreiranje dugmeta za količinu proizvoda
  Widget buildQuantityButton(
      BuildContext context, IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[900],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
