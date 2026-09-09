import 'package:flutter/material.dart';
import 'filter_screen.dart';

class BeverageProduct {
  final String name;
  final String size;
  final double price;
  final String imagePath;

  const BeverageProduct({
    required this.name,
    required this.size,
    required this.price,
    required this.imagePath,
  });
}

const List<BeverageProduct> sampleBeverages = [
  const BeverageProduct(
    name: 'Diet Coke',
    size: '355ml',
    price: 1.99,
    imagePath: 'assets/images/pepsiii.png',
  ),
  const BeverageProduct(
    name: 'Sprite Can',
    size: '325ml',
    price: 1.50,
    imagePath: 'assets/images/sprite.png',
  ),
  const BeverageProduct(
    name: 'Apple & Grape Juice',
    size: '2L',
    price: 15.99,
    imagePath: 'assets/images/applejuice.png',
  ),
  const BeverageProduct(
    name: 'Orange Juice',
    size: '2L',
    price: 15.99,
    imagePath: 'assets/images/orange.png',
  ),
  const BeverageProduct(
    name: 'Coca Cola Can',
    size: '325ml',
    price: 4.99,
    imagePath: 'assets/images/pepsiii.png',
  ),
  const BeverageProduct(
    name: 'Pepsi Can',
    size: '330ml',
    price: 4.99,
    imagePath: 'assets/images/pepsiii.png',
  ),
];

class BeveragesScreen extends StatelessWidget {
  final List<BeverageProduct> products;

  const BeveragesScreen({super.key, this.products = sampleBeverages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Beverages',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FiltersScreen()),
              );
              if (result != null) {
                debugPrint('Selected filters: $result');
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            return BeverageCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class BeverageCard extends StatelessWidget {
  final BeverageProduct product;

  const BeverageCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E8E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.local_drink, size: 48, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${product.size}, Price',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3EAE5D),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
