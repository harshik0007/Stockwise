import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_images.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';
import 'package:flutter_application_1/navigation/main_screen.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
          AppStrings.aboutApp,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // ABOUT APP CONTENT
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 72),

                  // LOGO
                  Image.asset(
                    AppImages.logo,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 4),

                  // APP NAME
                  Text(
                    AppStrings.appName,
                    style: TextStyle(
                      fontSize: AppSizes.heading,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // APP DESCRIPTION
                  Text(
                    AppStrings.simpleInventory,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppSizes.extraSmall,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // VERSION
                  Text(
                    AppStrings.version,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BOTTOM NAVIGATION
          // _buildBottomNavigation(context),
        ],
      ),
    );
  }

  // Widget _buildBottomNavigation(BuildContext context) {
  //   return Container(
  //     height: 66,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border(top: BorderSide(color: Colors.grey.shade300)),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildNavItem(
  //           context: context,
  //           icon: Icons.home_outlined,
  //           label: AppStrings.dashboard,
  //           selected: false,
  //           index: 0,
  //         ),

  //         _buildNavItem(
  //           context: context,
  //           icon: Icons.inventory_2_outlined,
  //           label: AppStrings.product,
  //           selected: false,
  //           index: 1,
  //         ),

  //         _buildNavItem(
  //           context: context,
  //           icon: Icons.inventory_2,
  //           label: AppStrings.stock,
  //           selected: true,
  //           index: 2,
  //         ),

  //         _buildNavItem(
  //           context: context,
  //           icon: Icons.shopping_cart_outlined,
  //           label: AppStrings.sales,
  //           selected: false,
  //           index: 3,
  //         ),

  //         _buildNavItem(
  //           context: context,
  //           icon: Icons.person_outline,
  //           label: AppStrings.settings,
  //           selected: false,
  //           index: 4,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildNavItem({
  //   required BuildContext context,
  //   required IconData icon,
  //   required String label,
  //   required bool selected,
  //   required int index,
  // }) {
  //   return MouseRegion(
  //     cursor: SystemMouseCursors.click,
  //     child: GestureDetector(
  //       onTap: () {
  //         Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(builder: (_) => MainScreen(initialIndex: index)),
  //           (route) => false,
  //         );
  //       },
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             icon,
  //             size: 25,
  //             color: selected ? AppColors.primaryColor : Colors.grey,
  //           ),

  //           const SizedBox(height: 2),

  //           Text(
  //             label,
  //             style: TextStyle(
  //               fontSize: 11,
  //               color: selected ? AppColors.primaryColor : Colors.grey,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
