import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_text_size.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // ==========================================================
  // SEARCH CONTROLLER
  // ==========================================================

  final TextEditingController searchController = TextEditingController();

  // ==========================================================
  // PRODUCT DATA
  // ==========================================================

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Bangles',
      'stock': 1000,
      'price': 199,
      'image': 'assets/images/img1.jpg',
    },
    {
      'name': 'Jhumkha',
      'stock': 500,
      'price': 149,
      'image': 'assets/images/img2.jpg',
    },
  ];

  String searchText = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    // Filter products according to search
    final filteredProducts = products.where((product) {
      final productName = product['name'].toString().toLowerCase();

      return productName.contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,

      // ======================================================
      // APP BAR
      // ======================================================
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          'Products',

          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 25),

            onPressed: () {
              // Add Product page will be connected later.
            },
          ),
        ],
      ),

      // ======================================================
      // BODY
      // ======================================================
      body: Column(
        children: [
          // ==================================================
          // SORT + PRICE RANGE
          // ==================================================
          SizedBox(
            height: 36,

            child: Row(
              children: [
                // SORT
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _showSortOptions(context);
                    },

                    child: Container(
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey.shade300),
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),

                      child: const Text(
                        'Sort',

                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // PRICE RANGE
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _showPriceRange(context);
                    },

                    child: Container(
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),

                      child: const Text(
                        'Prize Range',

                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ==================================================
          // SEARCH BAR
          // ==================================================
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 8),

            child: SizedBox(
              height: 34,

              child: TextField(
                controller: searchController,

                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },

                decoration: InputDecoration(
                  hintText: 'Search here...',

                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),

                  prefixIcon: const Icon(Icons.search, size: 21),

                  suffixIcon: searchText.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, size: 17),
                          onPressed: () {
                            searchController.clear();

                            setState(() {
                              searchText = '';
                            });
                          },
                        )
                      : null,

                  contentPadding: const EdgeInsets.symmetric(vertical: 5),

                  filled: true,
                  fillColor: Colors.white,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),

                    borderSide: BorderSide(color: Colors.grey.shade500),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),

                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ==================================================
          // PRODUCT LIST
          // ==================================================
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 2,
                    ),

                    itemCount: filteredProducts.length,

                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];

                      return _buildProductCard(product);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // PRODUCT CARD
  // ==========================================================

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      height: 74,

      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(5),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(8),

        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          // ==================================================
          // PRODUCT IMAGE
          // ==================================================
          ClipRRect(
            borderRadius: BorderRadius.circular(7),

            child: Image.asset(
              product['image'],

              width: 56,
              height: 64,

              fit: BoxFit.cover,

              // If image is missing, show an icon instead
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 56,
                  height: 64,

                  color: Colors.grey.shade200,

                  child: const Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 10),

          // ==================================================
          // PRODUCT INFORMATION
          // ==================================================
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Product Name :- ${product['name']}',

                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Stock :- ${product['stock']}',

                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'One piece price:- ₹${product['price']}',

                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // SORT OPTIONS
  // ==========================================================

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,

      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const Padding(
                padding: EdgeInsets.all(15),

                child: Text(
                  'Sort Products',

                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              ListTile(
                title: const Text('Name: A to Z'),

                onTap: () {
                  setState(() {
                    products.sort((a, b) => a['name'].compareTo(b['name']));
                  });

                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Price: Low to High'),

                onTap: () {
                  setState(() {
                    products.sort((a, b) => a['price'].compareTo(b['price']));
                  });

                  Navigator.pop(context);
                },
              ),

              ListTile(
                title: const Text('Price: High to Low'),

                onTap: () {
                  setState(() {
                    products.sort((a, b) => b['price'].compareTo(a['price']));
                  });

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ==========================================================
  // PRICE RANGE
  // ==========================================================

  void _showPriceRange(BuildContext context) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text('Price Range'),

          content: const Text('Price range filter will be connected later.'),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
