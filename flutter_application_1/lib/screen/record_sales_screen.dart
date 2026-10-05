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
  String? selectedProduct;
  String? selectedStock;

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

      body: Column(
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

                  // CURRENT STOCK
                  DropdownButtonFormField<String>(
                    value: selectedStock,
                    decoration: _inputDecoration(AppStrings.currentStock),
                    icon: const Icon(Icons.keyboard_arrow_down, size: 20),
                    items: const [
                      DropdownMenuItem(value: '20', child: Text('20')),
                      DropdownMenuItem(value: '50', child: Text('50')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedStock = value;
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  // QUANTITY SOLD
                  _buildLabel(AppStrings.quantitySold),

                  const SizedBox(height: 5),

                  _buildTextField(
                    hintText: AppStrings.enterQuantity,
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 10),

                  // SELLING PRICE
                  _buildLabel(AppStrings.sellingPrice),

                  const SizedBox(height: 5),

                  _buildTextField(
                    hintText: AppStrings.enterSellingPrice,
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 10),

                  // TOTAL AMOUNT
                  _buildTotalAmount(),

                  const SizedBox(height: 10),

                  // NOTE
                  _buildLabel(AppStrings.noteOptional),

                  const SizedBox(height: 5),

                  _buildTextField(hintText: AppStrings.productNote),

                  const SizedBox(height: 18),

                  // RECORD SALE BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
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
    );
  }

  Widget _buildTextField({
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: 36,
      child: TextField(
        keyboardType: keyboardType,
        decoration: _inputDecoration(hintText),
      ),
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

          const Text(
            '0',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  
}
