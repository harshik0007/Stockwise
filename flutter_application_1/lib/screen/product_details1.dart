import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
import 'package:flutter_application_1/screen/product_screen.dart';


import 'edit_product.dart';
import 'delete_product.dart';



class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  // =================================================
  // BACK TO PRODUCT SCREEN
  // =================================================

  void goToProductScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductScreen(),
      ),
    );
  }

  // =================================================
  // EDIT PRODUCT
  // =================================================

  void editProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProductPage(),
      ),
    );
  }

  // =================================================
  // DELETE PRODUCT
  // =================================================

  void deleteProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DeleteProductPage(),
      ),
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

        toolbarHeight:
            AppSizes.appBarHeight,

        automaticallyImplyLeading: false,

        title: Row(
          children: [

            // ================= BACK BUTTON =================

            IconButton(
              onPressed: () {
                goToProductScreen(context);
              },

              padding: EdgeInsets.zero,

              icon: const Icon(
                Icons.arrow_back,

                color:
                    AppColors.white,

                size:
                    AppSizes.backIconSize,
              ),
            ),

            const SizedBox(
              width:
                  AppSizes.titleSpacing,
            ),

            // ================= TITLE =================

            const Text(
              AppStrings.productDetails,

              style: TextStyle(
                color:
                    AppColors.white,

                fontSize:
                    AppSizes.appBarTitleSize,

                fontWeight:
                    FontWeight.bold,
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

          // =================================================
          // PRODUCT INFORMATION
          // =================================================

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal:
                    AppSizes.detailsHorizontalPadding,
              ),

              child: Column(
                children: [

                  // ================= IMAGE =================

                  const SizedBox(
                    height:
                        AppSizes.detailsTopSpacing,
                  ),

                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(
                      AppSizes.productImageRadius,
                    ),

                    child: Image.asset(
                      'assets/images/bangles.jpg',

                      width:
                          AppSizes.productImageWidth,

                      height:
                          AppSizes.productImageHeight,

                      fit: BoxFit.cover,

                      errorBuilder:
                          (context, error, stackTrace) {
                        return Container(
                          width:
                              AppSizes.productImageWidth,

                          height:
                              AppSizes.productImageHeight,

                          color:
                              AppColors.white,

                          child: const Icon(
                            Icons.image,
                            size: 40,
                            color:
                                AppColors.grey,
                          ),
                        );
                      },
                    ),
                  ),

                  // ================= PRODUCT NAME =================

                  const SizedBox(
                    height:
                        AppSizes.productNameSpacing,
                  ),

                  const Text(
                    AppStrings.bangles,

                    style: TextStyle(
                      fontSize:
                          AppSizes.productNameSize,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          AppColors.black,
                    ),
                  ),

                  // ================= DETAILS =================

                  const SizedBox(
                    height:
                        AppSizes.detailsTopMargin,
                  ),

                  // Category
                  detailRow(
                    AppStrings.category,
                    AppStrings.banglesCategory,
                  ),

                  // Purchase Price
                  detailRow(
                    AppStrings.purchasePrice,
                    AppStrings.purchasePriceValue,
                  ),

                  // Selling Price
                  detailRow(
                    AppStrings.sellingPrice,
                    AppStrings.sellingPriceValue,
                  ),

                  // Stock
                  detailRow(
                    AppStrings.initialStock,
                    AppStrings.stockValue,
                  ),

                  // Minimum Stock
                  detailRow(
                    AppStrings.minimumStock,
                    AppStrings.minimumStockValue,
                  ),

                  // Description
                  detailRow(
                    AppStrings.description,
                    AppStrings.descriptionValue,
                  ),
                ],
              ),
            ),
          ),

          // =================================================
          // BUTTONS
          // =================================================

          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 28,
            ),

            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                // ================= EDIT =================

                SizedBox(
                  width:
                      AppSizes.buttonWidth,

                  height:
                      AppSizes.buttonHeight,

                  child: ElevatedButton(
                    onPressed: () {
                      editProduct(context);
                    },

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primary,

                      foregroundColor:
                          AppColors.white,

                      elevation:
                          AppSizes.buttonElevation,

                      padding:
                          EdgeInsets.zero,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          AppSizes.buttonRadius,
                        ),
                      ),
                    ),

                    child: const Text(
                      AppStrings.edit,

                      style: TextStyle(
                        fontSize:
                            AppSizes.buttonTextSize,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // ================= SPACE =================

                const SizedBox(
                  width:
                      AppSizes.buttonSpacing,
                ),

                // ================= DELETE =================

                SizedBox(
                  width:
                      AppSizes.buttonWidth,

                  height:
                      AppSizes.buttonHeight,

                  child: ElevatedButton(
                    onPressed: () {
                      deleteProduct(context);
                    },

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.red,

                      foregroundColor:
                          AppColors.white,

                      elevation:
                          AppSizes.buttonElevation,

                      padding:
                          EdgeInsets.zero,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          AppSizes.buttonRadius,
                        ),
                      ),
                    ),

                    child: const Text(
                      AppStrings.delete,

                      style: TextStyle(
                        fontSize:
                            AppSizes.buttonTextSize,

                        fontWeight:
                            FontWeight.bold,
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

  static Widget detailRow(
    String title,
    String value,
  ) {
    return SizedBox(
      height:
          AppSizes.detailRowHeight,

      child: Row(
        children: [

          // LEFT TEXT
          Expanded(
            child: Text(
              title,

              style: const TextStyle(
                fontSize:
                    AppSizes.detailFontSize,

                color:
                    AppColors.black,
              ),
            ),
          ),

          // RIGHT TEXT
          Text(
            value,

            style: const TextStyle(
              fontSize:
                  AppSizes.detailFontSize,

              color:
                  AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}