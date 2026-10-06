import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class RecordSalesScreen extends StatefulWidget {
  const RecordSalesScreen({super.key});

  @override
  State<RecordSalesScreen> createState() => _RecordSalesScreenState();
}

class _RecordSalesScreenState extends State<RecordSalesScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedProduct;
  final quantityController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final noteController = TextEditingController();
  double totalAmount = 0;

  @override
  void dispose() {
    quantityController.dispose();
    sellingPriceController.dispose();
    noteController.dispose();
    super.dispose();
  }

  void _updateTotalAmount() {
    final quantity = int.tryParse(quantityController.text) ?? 0;
    final price = double.tryParse(sellingPriceController.text) ?? 0;
    setState(() => totalAmount = quantity * price);
  }

  String? _validateProduct(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.productSelectionRequired;
    }
    return null;
  }

  String? _validateQuantity(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.quantityRequired;
    }

    final quantity = int.tryParse(value.trim());
    if (quantity == null) {
      return AppStrings.validWholeNumberRequired;
    }
    if (quantity <= 0) {
      return AppStrings.quantityMustBePositive;
    }
    return null;
  }

  String? _validateSellingPrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.sellingPriceRequired;
    }

    final price = double.tryParse(value.trim());
    if (price == null || !price.isFinite) {
      return AppStrings.validPriceRequired;
    }
    if (price <= 0) {
      return AppStrings.salePriceMustBePositive;
    }
    return null;
  }

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
          AppStrings.recordSalesTitle,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 24, 30, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PRODUCT
                  _buildLabel(AppStrings.product),

                  const SizedBox(height: 5),

                  DropdownButtonFormField<String>(
                    value: selectedProduct,
                    decoration: _inputDecoration(AppStrings.selectProduct),
                    validator: _validateProduct,
                    icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                    items: const [
                      DropdownMenuItem(
                        value: 'Jhumkha',
                        child: Text('Jhumkha'),
                      ),
                      DropdownMenuItem(
                        value: 'Bangles',
                        child: Text('Bangles'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedProduct = value;
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  _buildProductInfo(),

                  const SizedBox(height: 10),

                  // QUANTITY SOLD
                  _buildLabel(AppStrings.quantitySold),

                  const SizedBox(height: 5),

                  _buildTextField(
                    hintText: AppStrings.enterQuantity,
                    keyboardType: TextInputType.number,
                    controller: quantityController,
                    onChanged: (_) => _updateTotalAmount(),
                    validator: _validateQuantity,
                  ),

                  const SizedBox(height: 10),

                  // SELLING PRICE
                  _buildLabel(AppStrings.sellingPrice),

                  const SizedBox(height: 5),

                  _buildTextField(
                    hintText: AppStrings.enterSellingPrice,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: sellingPriceController,
                    onChanged: (_) => _updateTotalAmount(),
                    validator: _validateSellingPrice,
                  ),

                  const SizedBox(height: 10),

                  // TOTAL AMOUNT
                  _buildTotalAmount(),

                  const SizedBox(height: 10),

                  // NOTE
                  _buildLabel(AppStrings.noteOptional),

                  const SizedBox(height: 5),

                  _buildTextField(
                    hintText: AppStrings.productNote,
                    controller: noteController,
                  ),

                  const SizedBox(height: 18),

                  // RECORD SALE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                        // Backend logic will be added in PSEE.
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        AppStrings.recordSale,
                        style: TextStyle(
                          fontSize: AppSizes.small,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BOTTOM NAVIGATION
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: AppSizes.extraSmall,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 10, color: Colors.black),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      errorStyle: TextStyle(
        fontSize: AppSizes.extraSmall,
        color: AppColors.errorColor,
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    TextInputType? keyboardType,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      decoration: _inputDecoration(hintText),
    );
  }

  Widget _buildProductInfo() {
    final productCode = switch (selectedProduct) {
      'Jhumkha' => 'PRD-0002',
      'Bangles' => 'PRD-0001',
      _ => '—',
    };
    final currentStock = switch (selectedProduct) {
      'Jhumkha' => '500',
      'Bangles' => '1000',
      _ => '—',
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          _buildInfoRow(AppStrings.productCode, productCode),
          const SizedBox(height: 5),
          _buildInfoRow(AppStrings.currentStock, currentStock),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 11)),
        Text(value, style: const TextStyle(fontSize: 11)),
      ],
    );
  }

  Widget _buildTotalAmount() {
    return Container(
      height: 36,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.totalAmount,
            style: TextStyle(
              fontSize: AppSizes.extraSmall,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            '₹${totalAmount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
