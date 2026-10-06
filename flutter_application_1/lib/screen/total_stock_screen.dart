import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class TotalStockScreen extends StatelessWidget {
  const TotalStockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,

        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, size: 30),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),

        title: Text(
          AppStrings.totalStock,
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
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // OVERVIEW + LOW STOCK LIST
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.overview,
                        style: TextStyle(
                          fontSize: AppSizes.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.warningBackground,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          AppStrings.lowStockList,
                          style: TextStyle(
                            fontSize: AppSizes.extraSmall,
                            fontWeight: FontWeight.bold,
                            color: AppColors.warningColor,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // TOTAL STOCK CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
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
                          Icons.inventory_2_outlined,
                          size: 58,
                          color: AppColors.primaryColor,
                        ),

                        const SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2586',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),

                            Text(
                              AppStrings.totalItemsInStock,
                              style: TextStyle(
                                fontSize: AppSizes.extraSmall,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              AppStrings.allItemsAvailable,
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // STOCK STATUS CARDS
                  Row(
                    children: [
                      Expanded(
                        child: _buildStatusCard(
                          value: '1859',
                          label: AppStrings.inStock,
                          icon: Icons.inventory_2,
                          color: AppColors.successColor,
                          backgroundColor: AppColors.successBackground,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: _buildStatusCard(
                          value: '512',
                          label: AppStrings.lowStock,
                          icon: Icons.warning,
                          color: AppColors.warningColor,
                          backgroundColor: AppColors.warningBackground,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: _buildStatusCard(
                          value: '2',
                          label: AppStrings.outOfStock,
                          icon: Icons.info_outline,
                          color: AppColors.errorColor,
                          backgroundColor: AppColors.errorBackground,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // STOCK BY CATEGORY
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.stockByCategory,
                        style: TextStyle(
                          fontSize: AppSizes.small,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        AppStrings.viewAll,
                        style: TextStyle(
                          fontSize: AppSizes.extraSmall,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // BANGLES
                  _buildCategoryRow(AppStrings.bangles, '895'),

                  const SizedBox(height: 8),

                  // EARRINGS
                  _buildCategoryRow(AppStrings.earrings, '403'),
                ],
              ),
            ),
          ),

          
        ],
      ),
    );
  }

  Widget _buildStatusCard({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
    required Color backgroundColor,
  }) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 19, color: color),

          const SizedBox(height: 2),

          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(String category, String count) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: AppSizes.extraSmall,
              fontWeight: FontWeight.w500,
            ),
          ),

          Text(
            '$count ${AppStrings.items}',
            style: TextStyle(
              fontSize: AppSizes.extraSmall,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

}