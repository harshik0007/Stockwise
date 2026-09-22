import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 80, color: AppColors.primaryColor),

            const SizedBox(height: 8),

            Text(
              AppStrings.appName,
              style: TextStyle(
                fontSize: AppSizes.title,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              AppStrings.simpleInventory,
              style: TextStyle(
                fontSize: AppSizes.extraSmall, 
                color: AppColors.textColor,
              ),
            ),

            Text(
              AppStrings.system,
              style: TextStyle(
                fontSize: AppSizes.extraSmall, 
                color: AppColors.textColor,
              )
            ),
          ],
        ),
      ),
    );
  }
}
