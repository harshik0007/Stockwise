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
  String? selectedProduct;
  bool addStock = true;

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

      body: SingleChildScrollView(
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
              ),
              items: const [
                DropdownMenuItem(value: 'Product 1', child: Text('Product 1')),
                DropdownMenuItem(value: 'Product 2', child: Text('Product 2')),
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
                        '20',
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
                        '5',
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

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: AppStrings.enterQuantity,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
    );
  }
}
