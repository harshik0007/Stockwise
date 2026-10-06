import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
import 'package:flutter_application_1/screen/product_screen.dart';


class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController productNameController =
      TextEditingController();

  final TextEditingController categoryController =
      TextEditingController();

  final TextEditingController purchasePriceController =
      TextEditingController();

  final TextEditingController sellingPriceController =
      TextEditingController();

  final TextEditingController initialStockController =
      TextEditingController();

  final TextEditingController minimumStockController =
      TextEditingController();

  final TextEditingController imageController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    categoryController.dispose();
    purchasePriceController.dispose();
    sellingPriceController.dispose();
    initialStockController.dispose();
    minimumStockController.dispose();
    imageController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  // =================================================
  // BACK TO PRODUCT SCREEN
  // =================================================

  void goToProductScreen() {
    Navigator.pop(context);
  }

  // =================================================
  // SAVE PRODUCT
  // =================================================

  void saveProduct() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            AppStrings.productSaved,
          ),
          backgroundColor: AppColors.green,
        ),
      );
    }
  }

  // =================================================
  // NORMAL TEXT FIELD
  // =================================================

  Widget productField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool number = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(
            fontSize: AppSizes.labelSize,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),

        const SizedBox(
          height: AppSizes.labelSpacing,
        ),

        SizedBox(
          height: AppSizes.inputHeight,
          child: TextFormField(
            controller: controller,

            keyboardType: number
                ? TextInputType.number
                : TextInputType.text,

            style: const TextStyle(
              fontSize: AppSizes.inputTextSize,
            ),

            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty) {
                return 'Required';
              }

              return null;
            },

            decoration: InputDecoration(
              hintText: hint,

              hintStyle: const TextStyle(
                fontSize: AppSizes.hintTextSize,
                color: AppColors.grey,
              ),

              contentPadding:
                  const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),

              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.inputRadius,
                ),
                borderSide: const BorderSide(
                  color: AppColors.border,
                  width: 1.2,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.inputRadius,
                ),
                borderSide: const BorderSide(
                  color: AppColors.border,
                  width: 1.2,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(
                  AppSizes.inputRadius,
                ),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.2,
                ),
              ),

              errorStyle: const TextStyle(
                fontSize: 7,
              ),
            ),
          ),
        ),

        const SizedBox(
          height: AppSizes.fieldSpacing,
        ),
      ],
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
              onPressed: goToProductScreen,

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
              AppStrings.addProduct,

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

      body: Form(
        key: _formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.pageHorizontalPadding,
            AppSizes.pageTopPadding,
            AppSizes.pageHorizontalPadding,
            12,
          ),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // Product Name
              productField(
                label: AppStrings.productName,
                hint: AppStrings.enterProductName,
                controller:
                    productNameController,
              ),

              // Category
              productField(
                label: AppStrings.category,
                hint: AppStrings.enterCategory,
                controller:
                    categoryController,
              ),

              // Purchase Price
              productField(
                label: AppStrings.purchasePrice,
                hint: AppStrings.enterPurchasePrice,
                controller:
                    purchasePriceController,
                number: true,
              ),

              // Selling Price
              productField(
                label: AppStrings.sellingPrice,
                hint: AppStrings.enterSellingPrice,
                controller:
                    sellingPriceController,
                number: true,
              ),

              // Initial Stock
              productField(
                label: AppStrings.initialStock,
                hint: AppStrings.enterInitialStock,
                controller:
                    initialStockController,
                number: true,
              ),

              // Minimum Stock
              productField(
                label: AppStrings.minimumStock,
                hint: AppStrings.enterMinimumStock,
                controller:
                    minimumStockController,
                number: true,
              ),

              // =================================================
              // UPLOAD IMAGE
              // =================================================

              const Text(
                AppStrings.uploadImage,

                style: TextStyle(
                  fontSize: AppSizes.labelSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSizes.labelSpacing,
              ),

              SizedBox(
                height: AppSizes.inputHeight,
                child: TextFormField(
                  controller: imageController,

                  readOnly: true,

                  onTap: () {
                    imageController.text =
                        'Image selected';
                  },

                  style: const TextStyle(
                    fontSize:
                        AppSizes.inputTextSize,
                  ),

                  decoration: InputDecoration(
                    hintText:
                        AppStrings.clickHere,

                    hintStyle:
                        const TextStyle(
                      fontSize:
                          AppSizes.hintTextSize,
                      color: AppColors.grey,
                    ),

                    contentPadding:
                        const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.inputRadius,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            AppColors.border,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.inputRadius,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            AppColors.border,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: AppSizes.fieldSpacing,
              ),

              // =================================================
              // DESCRIPTION
              // =================================================

              const Text(
                AppStrings.description,

                style: TextStyle(
                  fontSize: AppSizes.labelSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: AppSizes.labelSpacing,
              ),

              SizedBox(
                height: 50,
                child: TextFormField(
                  controller:
                      descriptionController,

                  maxLines: 2,

                  style: const TextStyle(
                    fontSize:
                        AppSizes.inputTextSize,
                  ),

                  decoration: InputDecoration(
                    hintText:
                        AppStrings.enterDescription,

                    hintStyle:
                        const TextStyle(
                      fontSize:
                          AppSizes.hintTextSize,
                      color: AppColors.grey,
                    ),

                    contentPadding:
                        const EdgeInsets.all(10),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.inputRadius,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            AppColors.border,
                      ),
                    ),

                    enabledBorder:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(
                        AppSizes.inputRadius,
                      ),
                      borderSide:
                          const BorderSide(
                        color:
                            AppColors.border,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              // =================================================
              // SAVE PRODUCT BUTTON
              // =================================================

              Center(
                child: SizedBox(
                  width: double.infinity,
                  height:
                      AppSizes.saveButtonHeight,

                  child: ElevatedButton(
                    onPressed: saveProduct,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primary,

                      foregroundColor:
                          AppColors.white,

                      elevation:
                          AppSizes.saveButtonElevation,

                      shadowColor:
                          Colors.black54,

                      padding:
                          EdgeInsets.zero,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          AppSizes.saveButtonRadius,
                        ),
                      ),
                    ),

                    child: const Text(
                      AppStrings.saveProduct,

                      style: TextStyle(
                        fontSize:
                            AppSizes.saveButtonTextSize,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}