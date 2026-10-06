import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';
import 'update_stock_screen.dart';

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
                  InkWell(
                    onTap: () => _openUpdateStock(context),
                    child: _buildStockItem(
                      productCode: 'PRD-0002',
                      productName: AppStrings.jhumkha,
                      stock: '1',
                      minimum: '5',
                    ),
                  ),

                  // PRODUCT 2
                  InkWell(
                    onTap: () => _openUpdateStock(context),
                    child: _buildStockItem(
                      productCode: 'PRD-0001',
                      productName: AppStrings.bengals,
                      stock: '8',
                      minimum: '10',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BOTTOM NAVIGATION
        ],
      ),
    );
  }

  void _openUpdateStock(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const UpdateStockScreen()),
    );
  }

  Widget _buildStockItem({
    required String productCode,
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
                  '$productCode  $productName',
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
}
