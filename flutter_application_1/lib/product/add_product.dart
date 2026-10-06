import 'package:flutter/material.dart';

import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';

import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController productNameController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final TextEditingController purchasePriceController = TextEditingController();

  final TextEditingController sellingPriceController = TextEditingController();

  final TextEditingController initialStockController = TextEditingController();

  final TextEditingController minimumStockController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  XFile? productImage;

  Future<void> _pickProductImage() async {
    try {
      final selectedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (selectedImage != null && mounted) {
        setState(() {
          productImage = selectedImage;
        });
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Unable to select image'),
          backgroundColor: AppColors.errorColor,
        ),
      );
    }
  }

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
    Navigator.pop(context);
  }

  // =================================================
  // SAVE PRODUCT
  // =================================================

  void saveProduct() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(AppStrings.productSaved),
          backgroundColor: AppColors.green,
        ),
      );
    }
  }

  String? _requiredValidation(String? value, String message) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  String? _priceValidation(String? value, String requiredMessage) {
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

  String? _sellingPriceValidation(String? value) {
    final priceError = _priceValidation(value, AppStrings.sellingPriceRequired);
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

  String? _stockValidation(String? value, String requiredMessage) {
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

  // =================================================
  // NORMAL TEXT FIELD
  // =================================================

  Widget productField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
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
          keyboardType: keyboardType,

          style: const TextStyle(
            fontSize: AppSizes.small,
            color: AppColors.textColor,
          ),

          validator: validator,

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: const TextStyle(
              fontSize: AppSizes.small,
              color: AppColors.grey,
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.border, width: 1.2),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.border, width: 1.2),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.2,
              ),
            ),

            errorStyle: const TextStyle(
              fontSize: AppSizes.extraSmall,
              color: AppColors.errorColor,
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 1.2,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 1.2,
              ),
            ),
          ),
        ),

        const SizedBox(height: AppSizes.fieldSpacing),
      ],
    );
  }

  // =================================================
  // DESCRIPTION FIELD
  // =================================================

  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.description,
          style: TextStyle(
            fontSize: AppSizes.extraSmall,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),

        const SizedBox(height: AppSizes.labelSpacing),

        SizedBox(
          height: 50,
          child: TextFormField(
            controller: descriptionController,
            maxLines: 2,

            style: const TextStyle(
              fontSize: AppSizes.small,
              color: AppColors.textColor,
            ),

            decoration: InputDecoration(
              hintText: AppStrings.enterDescription,

              hintStyle: const TextStyle(
                fontSize: AppSizes.small,
                color: AppColors.grey,
              ),

              contentPadding: const EdgeInsets.all(10),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(
                  color: AppColors.border,
                  width: 1.2,
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(
                  color: AppColors.border,
                  width: 1.2,
                ),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(
                  color: AppColors.errorColor,
                  width: 1.2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.inputRadius),
                borderSide: const BorderSide(
                  color: AppColors.errorColor,
                  width: 1.2,
                ),
              ),
              errorStyle: const TextStyle(
                fontSize: AppSizes.extraSmall,
                color: AppColors.errorColor,
              ),
            ),
          ),
        ),

        const SizedBox(height: AppSizes.fieldSpacing),
      ],
    );
  }

  // =================================================
  // PRODUCT IMAGE FIELD
  // =================================================

  Widget _buildProductImageField() {
    return MouseRegion(
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

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),

            prefixIconConstraints: const BoxConstraints.tightFor(
              width: 32,
              height: 30,
            ),

            suffixIconConstraints: const BoxConstraints.tightFor(
              width: 32,
              height: 30,
            ),

            prefixIcon: productImage == null
                ? const Icon(
                    Icons.upload_file_outlined,
                    size: 18,
                    color: AppColors.grey,
                  )
                : FutureBuilder(
                    future: productImage!.readAsBytes(),
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: 28,
                        height: 28,
                        child: snapshot.hasData
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.image_outlined,
                                size: 18,
                                color: AppColors.grey,
                              ),
                      );
                    },
                  ),

            suffixIcon: productImage == null
                ? null
                : MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: IconButton(
                      constraints: const BoxConstraints.tightFor(
                        width: 30,
                        height: 30,
                      ),
                      padding: EdgeInsets.zero,
                      tooltip: AppStrings.removeImage,

                      onPressed: () {
                        setState(() {
                          productImage = null;
                        });
                      },

                      icon: const Icon(
                        Icons.close,
                        size: 16,
                        color: AppColors.grey,
                      ),
                    ),
                  ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.border, width: 1.2),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(color: AppColors.border, width: 1.2),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.inputRadius),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.2,
              ),
            ),
          ),

          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productImage?.name ?? AppStrings.clickHere,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: AppSizes.small,
                color: AppColors.textColor,
              ),
            ),
          ),
        ),
      ),
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
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        toolbarHeight: AppSizes.appBarHeight,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,

              child: IconButton(
                onPressed: goToProductScreen,
                padding: EdgeInsets.zero,

                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: AppSizes.backIconSize,
                ),
              ),
            ),

            const SizedBox(width: AppSizes.titleSpacing),

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
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // PRODUCT IMAGE
              const Text(
                AppStrings.productImage,

                style: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: AppSizes.labelSpacing),

              _buildProductImageField(),

              const SizedBox(height: AppSizes.fieldSpacing),

              // PRODUCT NAME
              productField(
                label: AppStrings.productName,
                hint: AppStrings.enterProductName,
                controller: productNameController,
                validator: (value) => _requiredValidation(
                  value,
                  AppStrings.productNameRequired,
                ),
              ),

              // CATEGORY
              productField(
                label: AppStrings.category,
                hint: AppStrings.enterCategory,
                controller: categoryController,
                validator: (value) => _requiredValidation(
                  value,
                  AppStrings.categoryRequired,
                ),
              ),

              // DESCRIPTION
              _buildDescriptionField(),

              // PURCHASE PRICE
              productField(
                label: AppStrings.purchasePrice,
                hint: AppStrings.enterPurchasePrice,
                controller: purchasePriceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: (value) =>
                    _priceValidation(value, AppStrings.purchasePriceRequired),
              ),

              // SELLING PRICE
              productField(
                label: AppStrings.sellingPrice,
                hint: AppStrings.enterSellingPrice,
                controller: sellingPriceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                validator: _sellingPriceValidation,
              ),

              // MINIMUM STOCK
              productField(
                label: AppStrings.minimumStock,
                hint: AppStrings.enterMinimumStock,
                controller: minimumStockController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    _stockValidation(value, AppStrings.minimumStockRequired),
              ),

              // INITIAL STOCK
              productField(
                label: AppStrings.initialStock,
                hint: AppStrings.enterInitialStock,
                controller: initialStockController,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    _stockValidation(value, AppStrings.initialStockRequired),
              ),

              const SizedBox(height: 5),

              // =================================================
              // ADD PRODUCT BUTTON
              // =================================================
              SizedBox(
                width: double.infinity,
                height: AppSizes.saveButtonHeight,

                child: ElevatedButton(
                  onPressed: saveProduct,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,

                    foregroundColor: AppColors.white,

                    elevation: AppSizes.saveButtonElevation,

                    shadowColor: AppColors.blackShadow,

                    padding: EdgeInsets.zero,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSizes.saveButtonRadius,
                      ),
                    ),
                  ),

                  child: const Text(
                    AppStrings.addProduct,

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
}
