import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';

class DeleteProductPage extends StatelessWidget {
  const DeleteProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        toolbarHeight: AppSizes.appBarHeight,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },

              padding: EdgeInsets.zero,

              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: AppSizes.backIconSize,
              ),
            ),

            const SizedBox(
              width: AppSizes.titleSpacing,
            ),

            const Text(
              AppStrings.deleteProduct,
              style: TextStyle(
                color: AppColors.white,
                fontSize: AppSizes.appBarTitleSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: Column(
        children: [

          const SizedBox(
            height: AppSizes.topSpacing,
          ),

          // ================= DELETE ICON CIRCLE =================
          Container(
            width: AppSizes.deleteCircleSize,
            height: AppSizes.deleteCircleSize,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: AppColors.circleBackground,

              border: Border.all(
                color: AppColors.circleBorder,
                width: 1,
              ),

              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),

            child: const Center(
              child: Icon(
                Icons.delete,
                color: AppColors.deleteRed,
                size: AppSizes.deleteIconSize,
              ),
            ),
          ),

          // ================= TITLE =================
          const SizedBox(
            height: AppSizes.titleSpacingAfterIcon,
          ),

          const Text(
            AppStrings.deleteProductQuestion,

            style: TextStyle(
              fontSize: AppSizes.questionFontSize,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),

          // ================= DESCRIPTION =================
          const SizedBox(
            height: AppSizes.descriptionSpacing,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),

            child: Text(
              AppStrings.deleteConfirmation,

              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: AppSizes.descriptionFontSize,
                height: AppSizes.descriptionLineHeight,
                color: AppColors.black,
              ),
            ),
          ),

          const Spacer(),

          // ================= BUTTONS =================
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              AppSizes.bottomPadding,
            ),

            child: Row(
              children: [

                // ================= CANCEL =================
                Expanded(
                  child: SizedBox(
                    height: AppSizes.buttonHeight,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,

                        elevation: AppSizes.buttonElevation,

                        shadowColor: AppColors.blackShadow,

                        padding: EdgeInsets.zero,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSizes.buttonRadius,
                          ),
                        ),
                      ),

                      child: const Text(
                        AppStrings.cancel,

                        style: TextStyle(
                          fontSize: AppSizes.buttonFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  width: AppSizes.buttonSpacing,
                ),

                // ================= DELETE =================
                Expanded(
                  child: SizedBox(
                    height: AppSizes.buttonHeight,

                    child: ElevatedButton(
                      onPressed: () {
                        deleteProduct(context);
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white,

                        elevation: AppSizes.buttonElevation,

                        shadowColor: AppColors.blackShadow,

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
                          fontSize: AppSizes.buttonFontSize,
                          fontWeight: FontWeight.bold,
                        ),
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

  // ================= DELETE FUNCTION =================

  void deleteProduct(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.productDeleted,
        ),

        backgroundColor: AppColors.errorColor,

        duration: Duration(
          seconds: 2,
        ),
      ),
    );

    Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
      () {
        Navigator.pop(context);
      },
    );
  }
}