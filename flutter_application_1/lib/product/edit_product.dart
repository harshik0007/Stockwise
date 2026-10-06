import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
import 'package:image_picker/image_picker.dart';

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

  final TextEditingController productNameController = TextEditingController(
    text: 'Bangles',
  );

  final TextEditingController productCodeController = TextEditingController(
    text: 'PRD-0001',
  );

  final TextEditingController categoryController = TextEditingController(
    text: 'Bangles',
  );

  final TextEditingController purchasePriceController = TextEditingController(
    text: '80',
  );

  final TextEditingController sellingPriceController = TextEditingController(
    text: '149',
  );

  final TextEditingController minimumStockController = TextEditingController(
    text: '100',
  );

  final TextEditingController descriptionController = TextEditingController(
    text: 'Golden banges',
  );

  XFile? productImage;

  Future<void> _pickProductImage() async {
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage != null && mounted) {
      setState(() => productImage = selectedImage);
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    productCodeController.dispose();
    categoryController.dispose();
    purchasePriceController.dispose();
    sellingPriceController.dispose();
    minimumStockController.dispose();
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
  // REQUIRED VALIDATION
  // =================================================

  String? requiredValidation(String? value, String requiredMessage) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    return null;
  }

  // =================================================
  // PRICE VALIDATION
  // =================================================

  String? priceValidation(String? value, String requiredMessage) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    final price = double.tryParse(value.replaceAll('₹', '').trim());

    if (price == null || !price.isFinite) {
      return AppStrings.validPriceRequired;
    }

    if (price < 0) {
      return AppStrings.negativePriceNotAllowed;
    }

    return null;
  }

  // =================================================
  // STOCK VALIDATION
  // =================================================

  String? stockValidation(String? value, String requiredMessage) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage;
    }

    final stock = int.tryParse(value.trim());

    if (stock == null) {
      return AppStrings.validWholeNumberRequired;
    }

    if (stock < 0) {
      return AppStrings.negativeStockNotAllowed;
    }

    return null;
  }

  String? sellingPriceValidation(String? value) {
    final priceError = priceValidation(
      value,
      AppStrings.sellingPriceRequired,
    );
    if (priceError != null) {
      return priceError;
    }

    final purchasePrice = double.tryParse(
      purchasePriceController.text.replaceAll('₹', '').trim(),
    );
    final sellingPrice = double.parse(value!.replaceAll('₹', '').trim());
    if (purchasePrice != null && sellingPrice < purchasePrice) {
      return AppStrings.sellingPriceBelowPurchasePrice;
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

    // ================= SUCCESS =================

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(AppStrings.updatedSuccessfully),
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
    bool readOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppSizes.extraSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),

        const SizedBox(height: AppSizes.labelSpacing),

        TextFormField(
          controller: controller,
          readOnly: readOnly,

          keyboardType: keyboardType,

          validator: validator,

          style: const TextStyle(
            fontSize: AppSizes.small,
            color: AppColors.black,
          ),

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.border),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.border),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.primary),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.errorColor),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.errorColor),
            ),

            errorStyle: const TextStyle(
              fontSize: AppSizes.extraSmall,
              color: AppColors.errorColor,
            ),
          ),
        ),

        const SizedBox(height: AppSizes.fieldSpacing),
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

            const SizedBox(width: AppSizes.titleSpacing),

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
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                AppStrings.productImage,
                style: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSizes.labelSpacing),
              _buildProductImageField(),
              const SizedBox(height: AppSizes.fieldSpacing),

              productField(
                label: AppStrings.productCode,
                controller: productCodeController,
                readOnly: true,
              ),

              // PRODUCT NAME
              productField(
                label: AppStrings.productName,
                controller: productNameController,

                validator: (value) {
                  return requiredValidation(
                    value,
                    AppStrings.productNameRequired,
                  );
                },
              ),

              // CATEGORY
              productField(
                label: AppStrings.category,
                controller: categoryController,

                validator: (value) {
                  return requiredValidation(value, AppStrings.categoryRequired);
                },
              ),

              // DESCRIPTION
              productField(
                label: AppStrings.description,
                controller: descriptionController,
              ),

              // PURCHASE PRICE
              productField(
                label: AppStrings.purchasePrice,
                controller: purchasePriceController,

                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),

                validator: (value) {
                  return priceValidation(
                    value,
                    AppStrings.purchasePriceRequired,
                  );
                },
              ),

              // SELLING PRICE
              productField(
                label: AppStrings.sellingPrice,
                controller: sellingPriceController,

                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),

                validator: sellingPriceValidation,
              ),

              // MINIMUM STOCK
              productField(
                label: AppStrings.minimumStock,
                controller: minimumStockController,

                keyboardType: TextInputType.number,

                validator: (value) {
                  return stockValidation(
                    value,
                    AppStrings.minimumStockRequired,
                  );
                },
              ),

              const SizedBox(height: 10),

              // =================================================
              // UPDATE BUTTON
              // =================================================
              SizedBox(
                width: double.infinity,
                height: AppSizes.saveButtonHeight,

                child: ElevatedButton(
                  onPressed: updateProduct,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,

                    foregroundColor: AppColors.white,

                    elevation: AppSizes.saveButtonElevation,

                    shadowColor: Colors.black54,

                    padding: EdgeInsets.zero,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSizes.saveButtonRadius,
                      ),
                    ),
                  ),

                  child: const Text(
                    AppStrings.updateProduct,

                    style: TextStyle(
                      fontSize: AppSizes.saveButtonTextSize,

                      fontWeight: FontWeight.bold,
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

  Widget _buildProductImageField() {
    return SizedBox(
      height: AppSizes.inputHeight,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: _pickProductImage,
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: AppStrings.uploadImage,
              hintStyle: const TextStyle(
                fontSize: AppSizes.small,
                color: AppColors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              prefixIconConstraints: const BoxConstraints.tightFor(
                width: 32,
                height: 30,
              ),
              suffixIconConstraints: const BoxConstraints.tightFor(
                width: 32,
                height: 30,
              ),
              prefixIcon: productImage == null
                  ? const Icon(Icons.upload_file_outlined, size: 18)
                  : FutureBuilder(
                      future: productImage!.readAsBytes(),
                      builder: (context, snapshot) => SizedBox(
                        width: 28,
                        height: 28,
                        child: snapshot.hasData
                            ? Image.memory(snapshot.data!, fit: BoxFit.cover)
                            : const Icon(Icons.image_outlined, size: 18),
                      ),
                    ),
              suffixIcon: productImage == null
                  ? null
                  : IconButton(
                      constraints: const BoxConstraints.tightFor(
                        width: 30,
                        height: 30,
                      ),
                      padding: EdgeInsets.zero,
                      tooltip: AppStrings.removeImage,
                      onPressed: () => setState(() => productImage = null),
                      icon: const Icon(Icons.close, size: 16),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(color: AppColors.border),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                productImage?.name ?? AppStrings.clickHere,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: AppSizes.small),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
