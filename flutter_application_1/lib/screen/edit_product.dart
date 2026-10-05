import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
import 'package:flutter_application_1/screen/product_screen.dart';


class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {

  // =================================================
  // FORM KEY
  // =================================================

  final _formKey = GlobalKey<FormState>();

  // =================================================
  // CONTROLLERS
  // =================================================

  final TextEditingController productNameController =
      TextEditingController(text: 'Bangles');

  final TextEditingController categoryController =
      TextEditingController(text: 'Bangles');

  final TextEditingController purchasePriceController =
      TextEditingController(text: '80');

  final TextEditingController sellingPriceController =
      TextEditingController(text: '149');

  final TextEditingController initialStockController =
      TextEditingController(text: '1000');

  final TextEditingController minimumStockController =
      TextEditingController(text: '100');

  final TextEditingController descriptionController =
      TextEditingController(text: 'Golden banges');


  @override
  void dispose() {
    productNameController.dispose();
    categoryController.dispose();
    purchasePriceController.dispose();
    sellingPriceController.dispose();
    initialStockController.dispose();
    minimumStockController.dispose();
    descriptionController.dispose();

    super.dispose();
  }


  // =================================================
  // BACK TO PRODUCT SCREEN
  // =================================================

  void goToProductScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProductScreen(),
      ),
    );
  }


  // =================================================
  // REQUIRED VALIDATION
  // =================================================

  String? requiredValidation(
    String? value,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }


  // =================================================
  // PRICE VALIDATION
  // =================================================

  String? priceValidation(
    String? value,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final price = double.tryParse(
      value.replaceAll('₹', '').trim(),
    );

    if (price == null) {
      return 'Enter a valid price';
    }

    if (price < 0) {
      return 'Price cannot be negative';
    }

    return null;
  }


  // =================================================
  // STOCK VALIDATION
  // =================================================

  String? stockValidation(
    String? value,
    String fieldName,
  ) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final stock = int.tryParse(
      value.trim(),
    );

    if (stock == null) {
      return 'Enter a valid whole number';
    }

    if (stock < 0) {
      return 'Stock cannot be negative';
    }

    return null;
  }


  // =================================================
  // UPDATE PRODUCT
  // =================================================

  void updateProduct() {

    // First check all fields
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Convert prices
    final purchasePrice = double.parse(
      purchasePriceController.text
          .replaceAll('₹', '')
          .trim(),
    );

    final sellingPrice = double.parse(
      sellingPriceController.text
          .replaceAll('₹', '')
          .trim(),
    );

    // Check selling price
    if (sellingPrice < purchasePrice) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Selling price cannot be less than purchase price',
          ),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    // Convert stock
    final initialStock = int.parse(
      initialStockController.text.trim(),
    );

    final minimumStock = int.parse(
      minimumStockController.text.trim(),
    );

    // Check minimum stock
    if (minimumStock > initialStock) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Minimum stock cannot be greater than initial stock',
          ),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    // ================= SUCCESS =================

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.updatedSuccessfully,
        ),
        backgroundColor: AppColors.green,
      ),
    );

    // Database update code will come here later.
  }


  // =================================================
  // TEXT FIELD
  // =================================================

  Widget productField({
    required String label,
    required TextEditingController controller,
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
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

        TextFormField(
          controller: controller,

          keyboardType: keyboardType,

          validator: validator,

          style: const TextStyle(
            fontSize: AppSizes.inputTextSize,
            color: AppColors.black,
          ),

          decoration: InputDecoration(

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
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                AppSizes.inputRadius,
              ),
              borderSide: const BorderSide(
                color: AppColors.border,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                AppSizes.inputRadius,
              ),
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                AppSizes.inputRadius,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(
                AppSizes.inputRadius,
              ),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            errorStyle: const TextStyle(
              fontSize: 8,
              color: Colors.red,
            ),
          ),
        ),

        const SizedBox(
          height: AppSizes.fieldSpacing,
        ),
      ],
    );
  }


  // =================================================
  // BUILD
  // =================================================

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
              AppStrings.editProduct,
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
      // FORM
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

              // PRODUCT NAME
              productField(
                label: AppStrings.productName,
                controller: productNameController,

                validator: (value) {
                  return requiredValidation(
                    value,
                    'Product name',
                  );
                },
              ),


              // CATEGORY
              productField(
                label: AppStrings.category,
                controller: categoryController,

                validator: (value) {
                  return requiredValidation(
                    value,
                    'Category',
                  );
                },
              ),


              // PURCHASE PRICE
              productField(
                label: AppStrings.purchasePrice,
                controller: purchasePriceController,

                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),

                validator: (value) {
                  return priceValidation(
                    value,
                    'Purchase price',
                  );
                },
              ),


              // SELLING PRICE
              productField(
                label: AppStrings.sellingPrice,
                controller: sellingPriceController,

                keyboardType:
                    const TextInputType.numberWithOptions(
                  decimal: true,
                ),

                validator: (value) {
                  return priceValidation(
                    value,
                    'Selling price',
                  );
                },
              ),


              // INITIAL STOCK
              productField(
                label: AppStrings.initialStock,
                controller: initialStockController,

                keyboardType:
                    TextInputType.number,

                validator: (value) {
                  return stockValidation(
                    value,
                    'Initial stock',
                  );
                },
              ),


              // MINIMUM STOCK
              productField(
                label: AppStrings.minimumStock,
                controller: minimumStockController,

                keyboardType:
                    TextInputType.number,

                validator: (value) {
                  return stockValidation(
                    value,
                    'Minimum stock',
                  );
                },
              ),


              // DESCRIPTION
              productField(
                label: AppStrings.description,
                controller: descriptionController,

                validator: (value) {
                  return requiredValidation(
                    value,
                    'Description',
                  );
                },
              ),


              const SizedBox(
                height: 10,
              ),


              // =================================================
              // UPDATE BUTTON
              // =================================================

              SizedBox(
                width: double.infinity,
                height: AppSizes.saveButtonHeight,

                child: ElevatedButton(
                  onPressed: updateProduct,

                  style: ElevatedButton.styleFrom(
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
                    AppStrings.updateProduct,

                    style: TextStyle(
                      fontSize:
                          AppSizes.saveButtonTextSize,

                      fontWeight:
                          FontWeight.bold,
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