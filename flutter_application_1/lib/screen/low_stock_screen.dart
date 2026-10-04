import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class LowStockScreen extends StatelessWidget {
  const LowStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          AppStrings.lowStockTitle,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
              child: Column(
                children: [
                  // MINIMUM STOCK LIST
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.warningBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          size: 20,
                          color: AppColors.warningColor,
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            AppStrings.minimumStockList,
                            style: TextStyle(
                              fontSize: AppSizes.small,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // PRODUCT 1
                  _buildStockItem(
                    productName: AppStrings.jhumkha,
                    stock: '1',
                    minimum: '5',
                  ),

                  // PRODUCT 2
                  _buildStockItem(
                    productName: AppStrings.bengals,
                    stock: '8',
                    minimum: '10',
                  ),
                ],
              ),
            ),
          ),

          // BOTTOM NAVIGATION
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildStockItem({
    required String productName,
    required String stock,
    required String minimum,
  }) {
    return Container(
      width: double.infinity,
      height: 72,
      margin: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),

          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 21,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: AppSizes.extraSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 1),

                Text(
                  '${AppStrings.stockText}: $stock',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

                Text(
                  '${AppStrings.minText}: $minimum',
                  style: TextStyle(fontSize: 9, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          Icon(Icons.chevron_right, size: 28, color: Colors.grey.shade700),

          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            label: AppStrings.dashboard,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.inventory_2_outlined,
            label: AppStrings.product,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.inventory_2,
            label: AppStrings.stock,
            selected: true,
          ),

          _buildNavItem(
            icon: Icons.shopping_cart_outlined,
            label: AppStrings.sales,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.person_outline,
            label: AppStrings.settings,
            selected: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool selected,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 25,
          color: selected ? AppColors.primaryColor : Colors.grey,
        ),

        const SizedBox(height: 2),

        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: selected ? AppColors.primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
