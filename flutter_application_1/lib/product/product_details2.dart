import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_images.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
import 'edit_product.dart';
import 'delete_product.dart';

class ProductDetailsPage2 extends StatelessWidget {
  const ProductDetailsPage2({super.key});

  // =================================================
  // BACK TO PRODUCT SCREEN
  // =================================================

  void goToProductScreen(BuildContext context) {
    Navigator.pop(context);
  }

  // =================================================
  // EDIT PRODUCT
  // =================================================

  void editProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProductPage()),
    );
  }

  // =================================================
  // DELETE PRODUCT
  // =================================================

  void deleteProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DeleteProductPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // =================================================
      // APP BAR
      // =================================================
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        toolbarHeight: AppSizes.appBarHeight,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            // BACK BUTTON
            IconButton(
              onPressed: () {
                goToProductScreen(context);
              },
              padding: EdgeInsets.zero,

              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: AppSizes.backIconSize,
              ),
            ),

            const SizedBox(width: AppSizes.titleSpacing),

            const Text(
              AppStrings.productDetails,

              style: TextStyle(
                color: AppColors.white,
                fontSize: AppSizes.appBarTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // =================================================
      // BODY
      // =================================================
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.detailsHorizontalPadding,
              ),

              child: Column(
                children: [
                  // =================================================
                  // PRODUCT IMAGE
                  // =================================================
                  const SizedBox(height: AppSizes.detailsTopSpacing),

                  Container(
                    width: AppSizes.productImageWidth,

                    height: AppSizes.productImageHeight,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppSizes.productImageRadius,
                      ),

                      border: Border.all(
                        color: AppColors.imageBorder,
                        width: 1,
                      ),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSizes.productImageRadius,
                      ),

                      child: Image.asset(
                        AppImages.jumka,

                        fit: BoxFit.contain,

                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image,
                              size: 40,
                              color: AppColors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // =================================================
                  // PRODUCT NAME
                  // =================================================
                  const SizedBox(height: AppSizes.productNameSpacing),

                  const Text(
                    AppStrings.jhumkha,

                    style: TextStyle(
                      fontSize: AppSizes.productNameSize,

                      fontWeight: FontWeight.bold,

                      color: AppColors.black,
                    ),
                  ),

                  // =================================================
                  // DETAILS
                  // =================================================
                  const SizedBox(height: AppSizes.detailsTopMargin),

                  detailRow(AppStrings.productCode, 'PRD-0002'),

                  detailRow(AppStrings.category, AppStrings.jhumkhaCategory),

                  detailRow(
                    AppStrings.purchasePrice,
                    AppStrings.jhumkhaPurchasePrice,
                  ),

                  detailRow(
                    AppStrings.sellingPrice,
                    AppStrings.jhumkhaSellingPrice,
                  ),

                  detailRow(AppStrings.currentStock, AppStrings.jhumkhaStock),

                  detailRow(
                    AppStrings.minimumStock,
                    AppStrings.jhumkhaMinimumStock,
                  ),

                  detailRow(
                    AppStrings.description,
                    AppStrings.jhumkhaDescription,
                  ),

                  detailRow(AppStrings.createdAt, '01 Oct 2026'),
                  detailRow(AppStrings.updatedAt, '06 Oct 2026'),
                ],
              ),
            ),
          ),

          // =================================================
          // EDIT + DELETE BUTTONS
          // =================================================
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 28),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // =================================================
                // EDIT BUTTON
                // =================================================
                SizedBox(
                  width: AppSizes.buttonWidth,

                  height: AppSizes.buttonHeight,

                  child: ElevatedButton(
                    onPressed: () {
                      editProduct(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,

                      foregroundColor: AppColors.white,

                      elevation: AppSizes.buttonElevation,

                      padding: EdgeInsets.zero,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.buttonRadius,
                        ),
                      ),
                    ),

                    child: const Text(
                      AppStrings.edit,

                      style: TextStyle(
                        fontSize: AppSizes.buttonTextSize,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: AppSizes.buttonSpacing),

                // =================================================
                // DELETE BUTTON
                // =================================================
                SizedBox(
                  width: AppSizes.buttonWidth,

                  height: AppSizes.buttonHeight,

                  child: ElevatedButton(
                    onPressed: () {
                      deleteProduct(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,

                      foregroundColor: AppColors.white,

                      elevation: AppSizes.buttonElevation,

                      padding: EdgeInsets.zero,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.buttonRadius,
                        ),
                      ),
                    ),

                    child: const Text(
                      AppStrings.delete,

                      style: TextStyle(
                        fontSize: AppSizes.buttonTextSize,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =================================================
  // DETAIL ROW
  // =================================================

  static Widget detailRow(String title, String value) {
    return SizedBox(
      height: AppSizes.detailRowHeight,

      child: Row(
        children: [
          Expanded(
            child: Text(
              title,

              style: const TextStyle(
                fontSize: AppSizes.detailFontSize,

                color: AppColors.black,
              ),
            ),
          ),

          Text(
            value,

            style: const TextStyle(
              fontSize: AppSizes.detailFontSize,

              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
