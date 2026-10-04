import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // TOP BAR
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
          AppStrings.sales,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
              child: Column(
                children: [
                  // RECORD SALES BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 38,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEAF0FF),
                        foregroundColor: AppColors.primaryColor,
                        elevation: 2,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        AppStrings.recordSales,
                        style: TextStyle(
                          fontSize: AppSizes.small,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 9),

                  // MONTH DROPDOWN
                  Container(
                    width: double.infinity,
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined, size: 18),

                        const SizedBox(width: 10),

                        Text(
                          AppStrings.thisMonth,
                          style: TextStyle(
                            fontSize: AppSizes.extraSmall,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const Spacer(),

                        const Icon(Icons.keyboard_arrow_down, size: 22),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // SALE 1
                  _buildSaleCard(
                    date: '19 July 2026',
                    productName: AppStrings.jhumkha,
                    quantity: '5',
                    amount: 'Rs.1000',
                  ),

                  const SizedBox(height: 9),

                  // SALE 2
                  _buildSaleCard(
                    date: '19 July 2026',
                    productName: AppStrings.bengals,
                    quantity: '20',
                    amount: 'Rs.4000',
                  ),

                  const Spacer(),

                  // TOTAL SALES + ANALYZE
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 34,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF0FF),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '${AppStrings.totalSales}   ₹5000',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // ANALYZE BUTTON
                      SizedBox(
                        width: 82,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEAF0FF),
                            foregroundColor: AppColors.primaryColor,
                            elevation: 2,
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                          child: Text(
                            AppStrings.analyze,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildSaleCard({
    required String date,
    required String productName,
    required String quantity,
    required String amount,
  }) {
    return Container(
      width: double.infinity,
      height: 66,
      padding: const EdgeInsets.fromLTRB(8, 7, 8, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // DATE + TOP QTY
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(fontSize: 9, color: Colors.grey.shade700),
              ),

              Text(
                '${AppStrings.qty}: $quantity',
                style: TextStyle(fontSize: 9, color: Colors.grey.shade700),
              ),
            ],
          ),

          const SizedBox(height: 2),

          // PRODUCT
          Text(
            productName,
            style: TextStyle(
              fontSize: AppSizes.extraSmall,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          // BOTTOM QTY + PRICE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppStrings.qty}: $quantity',
                style: TextStyle(fontSize: 8, color: Colors.grey.shade600),
              ),

              Text(
                amount,
                style: TextStyle(
                  fontSize: 9,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.shopping_cart_outlined,
            label: AppStrings.sales,
            selected: true,
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
