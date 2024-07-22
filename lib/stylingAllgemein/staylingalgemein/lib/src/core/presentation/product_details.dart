import 'package:flutter/material.dart';

// Glavna klasa widgeta za prikaz detalja proizvoda
class ProductDetailScreenNew extends StatefulWidget {
  const ProductDetailScreenNew({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

// Klasa stanja widgeta ProductDetailScreenNew
class _ProductDetailScreenState extends State<ProductDetailScreenNew> {
  // Početne vrijednosti za veličinu, količinu i cijenu
  String selectedSize = 'Large';
  int quantity = 1;
  double price = 8.99;

  // Funkcija za ažuriranje cijene na temelju odabrane veličine
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

  // Funkcija za povećanje količine
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Funkcija za smanjenje količine, ali ne ispod 1
  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Prikaz modalnog prozora nakon prikaza widgeta
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showProductDetailModal(context);
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
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

  // Funkcija za prikaz modalnog prozora s detaljima proizvoda
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
                  children: [
                    // Pozadinski gradient za modalni prozor
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
                    // Slika i gumb za zatvaranje modalnog prozora
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/cat_cupcakes_3D.png',
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(
                                    width: 160), // Razmak između slike i gumba
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child:
                                        Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Detalji proizvoda unutar modalnog prozora Mogli cup i ostalo cijela kartica koja je crne boje
                    Positioned(
                      top: 150,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Mogli's Cup",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'A 8.99',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.white54,
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            // Prikaz sastojaka i recenzija
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ingredients',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.cake,
                                            color: Colors.white70, size: 16),
                                        Icon(Icons.icecream,
                                            color: Colors.white70, size: 16),
                                        Icon(Icons.cookie,
                                            color: Colors.white70, size: 16),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Reviews',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.white, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.white, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.white, size: 16),
                                        Icon(Icons.star,
                                            color: Colors.white, size: 16),
                                        Icon(Icons.star_border,
                                            color: Colors.white, size: 16),
                                        SizedBox(width: 5),
                                        Text(
                                          '4.0',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Donji dio modalnog prozora za odabir veličine, količine i narudžbu
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          // Gumbi za odabir veličine
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildSizeButton(
                                  context, 'Small', selectedSize == 'Small',
                                  () {
                                updatePrice('Small');
                              }),
                              buildSizeButton(
                                  context, 'Medium', selectedSize == 'Medium',
                                  () {
                                updatePrice('Medium');
                              }),
                              buildSizeButton(
                                  context, 'Large', selectedSize == 'Large',
                                  () {
                                updatePrice('Large');
                              }),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Gumbi za povećanje/smanjenje količine
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildQuantityButton(
                                  context, Icons.remove, decrementQuantity),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              buildQuantityButton(
                                  context, Icons.add, incrementQuantity),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Gumb za dodavanje u narudžbu
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(233, 159, 167, 1),
                                      Color.fromRGBO(208, 88, 182, 1),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                alignment: Alignment.center,
                                child: Text(
                                  'Add to order for A${(price * quantity).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
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

  // Funkcija za izradu gumba za veličinu
  Widget buildSizeButton(BuildContext context, String text, bool isSelected,
      VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 5, vertical: 5), // velicina dugmica small medium LArge
        margin: const EdgeInsets.symmetric(
            horizontal: 5), //small medium large razmak
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

  // Funkcija za izradu gumba za količinu
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
