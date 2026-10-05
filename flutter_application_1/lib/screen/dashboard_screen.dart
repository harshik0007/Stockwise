import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: Column(
          children: [
            // ==================================================
            // BLUE HEADER
            // ==================================================
            Container(
              width: double.infinity,
              height: 78,

              color: AppColors.primaryColor,

              alignment: Alignment.centerLeft,

              padding: const EdgeInsets.only(left: 32),

              child: Text(
                'Dashboard',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.title,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ==================================================
            // DASHBOARD CONTENT
            // ==================================================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // ==================================================
                    // GREETING
                    // ==================================================
                    const Text(
                      'Hello Owner!',

                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF32159C),
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      'Here’s your business overview',

                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    const SizedBox(height: 12),

                    // ==================================================
                    // STATISTICS CARDS
                    // ==================================================
                    Row(
                      children: [
                        Expanded(
                          child: _buildSummaryCard(
                            icon: Icons.shopping_basket,
                            iconColor: Colors.green,
                            value: '120',
                            title: 'Total',
                            subtitle: 'Products',
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: _buildSummaryCard(
                            icon: Icons.production_quantity_limits,
                            iconColor: Colors.blue,
                            value: '1,245',
                            title: 'Total',
                            subtitle: 'Stock',
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: _buildSummaryCard(
                            icon: Icons.priority_high,
                            iconColor: Colors.orange,
                            value: '18',
                            title: 'Low Stock',
                            subtitle: 'Items',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // ==================================================
                    // QUICK ACTIONS
                    // ==================================================
                    const Text(
                      'Quick Actions',

                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 11),

                    Row(
                      children: [
                        Expanded(
                          child: _buildActionCard(
                            icon: Icons.inventory_2,
                            iconColor: Colors.orange,
                            title: 'Products',
                            onTap: () {
                              // Open Products
                            },
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: _buildActionCard(
                            icon: Icons.shopping_cart,
                            iconColor: Colors.green,
                            title: 'Record Sale',
                            onTap: () {
                              // Record sale
                            },
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: _buildActionCard(
                            icon: Icons.inventory_2_outlined,
                            iconColor: Colors.blue,
                            title: 'Update Stock',
                            onTap: () {
                              // Update stock
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // ==================================================
                    // RECENT PRODUCTS HEADER
                    // ==================================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          'Recent Products',

                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            // Open all products
                          },

                          child: const Text(
                            'View All',

                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 75),

                    // ==================================================
                    // NO RECENT PRODUCTS
                    // ==================================================
                    const Center(
                      child: Text(
                        'No Recent products',

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // SUMMARY CARD
  // ==========================================================

  Widget _buildSummaryCard({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 104,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),

        border: Border.all(color: Colors.grey.shade500, width: 1),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(icon, size: 31, color: iconColor),

          const SizedBox(height: 2),

          Text(
            value,

            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          Text(
            title,

            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),

          Text(
            subtitle,

            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // QUICK ACTION CARD
  // ==========================================================

  Widget _buildActionCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(10),

      child: Container(
        height: 64,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),

          border: Border.all(color: Colors.grey.shade500, width: 1),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(icon, size: 29, color: iconColor),

            const SizedBox(height: 2),

            Text(
              title,

              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
