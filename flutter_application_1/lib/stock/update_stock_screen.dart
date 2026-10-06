import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class UpdateStockScreen extends StatefulWidget {
  const UpdateStockScreen({super.key});

  @override
  State<UpdateStockScreen> createState() => _UpdateStockScreenState();
}

class _UpdateStockScreenState extends State<UpdateStockScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  String? selectedProduct;
  bool addStock = true;

  int? get _currentStock => switch (selectedProduct) {
    'Bangles' => 1000,
    'Jhumkha' => 500,
    _ => null,
  };

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
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
    if (!addStock && _currentStock != null && quantity > _currentStock!) {
      return AppStrings.stockReductionExceedsCurrentStock;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          AppStrings.updateStock,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(38, 30, 38, 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product
            Text(
              AppStrings.product,
              style: TextStyle(
                fontSize: AppSizes.small,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            DropdownButtonFormField<String>(
              value: selectedProduct,
              decoration: InputDecoration(
                hintText: AppStrings.selectProduct,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.errorColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.errorColor),
                ),
                errorStyle: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  color: AppColors.errorColor,
                ),
              ),
              validator: _validateProduct,
              items: const [
                DropdownMenuItem(value: 'Bangles', child: Text('Bangles')),
                DropdownMenuItem(value: 'Jhumkha', child: Text('Jhumkha')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedProduct = value;
                });
              },
            ),

            const SizedBox(height: 16),

            // Stock information
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.currentStock,
                        style: TextStyle(
                          fontSize: AppSizes.small,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _currentStock?.toString() ?? '—',
                        style: TextStyle(
                          fontSize: AppSizes.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.productCode,
                        style: TextStyle(
                          fontSize: AppSizes.small,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        selectedProduct == null
                            ? '—'
                            : selectedProduct == 'Jhumkha'
                            ? 'PRD-0002'
                            : 'PRD-0001',
                        style: TextStyle(
                          fontSize: AppSizes.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.minimumStock,
                        style: TextStyle(
                          fontSize: AppSizes.small,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        selectedProduct == null ? '—' : '100',
                        style: TextStyle(
                          fontSize: AppSizes.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Action Type
            Text(
              AppStrings.actionType,
              style: TextStyle(
                fontSize: AppSizes.small,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<bool>(
              contentPadding: EdgeInsets.zero,
              title: Text(AppStrings.addStock),
              value: true,
              groupValue: addStock,
              onChanged: (value) {
                setState(() {
                  addStock = value!;
                });
              },
            ),

            RadioListTile<bool>(
              contentPadding: EdgeInsets.zero,
              title: Text(AppStrings.reduceStock),
              value: false,
              groupValue: addStock,
              onChanged: (value) {
                setState(() {
                  addStock = value!;
                });
              },
            ),

            // Quantity
            Text(
              AppStrings.quantity,
              style: TextStyle(
                fontSize: AppSizes.small,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: AppStrings.enterQuantity,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.errorColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.errorColor),
                ),
                errorStyle: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  color: AppColors.errorColor,
                ),
              ),
              validator: _validateQuantity,
            ),

            const SizedBox(height: 16),

            // Note
            Text(
              AppStrings.noteOptional,
              style: TextStyle(
                fontSize: AppSizes.small,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: AppStrings.enterNote,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Update Stock button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.validate();
                  // Update stock logic will come later
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  AppStrings.updateStock,
                  style: TextStyle(
                    fontSize: AppSizes.body,
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
