import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool oldPasswordVisible = false;
  bool newPasswordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emailRequired;
    }
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
      return AppStrings.validEmail;
    }
    return null;
  }

  String? _validateOldPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.passwordRequired;
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value.length < 8) {
      return AppStrings.passwordMinLength;
    }
    if (value == _oldPasswordController.text) {
      return AppStrings.newPasswordMustDiffer;
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (value != _newPasswordController.text) {
      return AppStrings.passwordsDoNotMatch;
    }
    return null;
  }

  void _submitChangePassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    // Backend/password update will be added in PSEE.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // APP BAR
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
          AppStrings.changePassword,
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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 38, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // EMAIL
                  _buildLabel(AppStrings.only_email),

                  const SizedBox(height: 5),

                  _buildTextField(
                    hintText: 'abc@gmail.com',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: _validateEmail,
                  ),

                  const SizedBox(height: 7),

                  // OLD PASSWORD
                  _buildLabel(AppStrings.oldPassword),

                  const SizedBox(height: 5),

                  _buildPasswordField(
                    hintText: '***********',
                    controller: _oldPasswordController,
                    validator: _validateOldPassword,
                    visible: oldPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        oldPasswordVisible = !oldPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 7),

                  // NEW PASSWORD
                  _buildLabel(AppStrings.newPassword),

                  const SizedBox(height: 5),

                  _buildPasswordField(
                    hintText: '***********',
                    controller: _newPasswordController,
                    validator: _validateNewPassword,
                    visible: newPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        newPasswordVisible = !newPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 7),

                  // CONFIRM PASSWORD
                  _buildLabel(AppStrings.conpassword),

                  const SizedBox(height: 5),

                  _buildPasswordField(
                    hintText: '***********',
                    controller: _confirmPasswordController,
                    validator: _validateConfirmPassword,
                    visible: confirmPasswordVisible,
                    onVisibilityChanged: () {
                      setState(() {
                        confirmPasswordVisible = !confirmPasswordVisible;
                      });
                    },
                  ),

                  const Spacer(),

                  // CHANGE PASSWORD BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _submitChangePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        AppStrings.changePassword,
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

  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),
          prefixIcon: Icon(prefixIcon, size: 16),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
          ),
          errorStyle: TextStyle(
            fontSize: AppSizes.extraSmall,
            color: AppColors.errorColor,
          ),
        ),
    );
  }

  Widget _buildPasswordField({
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    required bool visible,
    required VoidCallback onVisibilityChanged,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !visible,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 10, color: Colors.grey),

          prefixIcon: const Icon(Icons.lock_outline, size: 16),

          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onVisibilityChanged,
            icon: Icon(
              visible ? Icons.visibility : Icons.visibility_off,
              size: 16,
            ),
          ),

          contentPadding: const EdgeInsets.symmetric(vertical: 5),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
          ),
          errorStyle: TextStyle(
            fontSize: AppSizes.extraSmall,
            color: AppColors.errorColor,
          ),
        ),
    );
  }

  // Widget _buildBottomNavigation() {
  //   return Container(
  //     height: 66,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border(top: BorderSide(color: Colors.grey.shade300)),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildNavItem(
  //           icon: Icons.home_outlined,
  //           label: AppStrings.dashboard,
  //           selected: false,
  //         ),

  //         _buildNavItem(
  //           icon: Icons.inventory_2_outlined,
  //           label: AppStrings.product,
  //           selected: false,
  //         ),

  //         _buildNavItem(
  //           icon: Icons.inventory_2,
  //           label: AppStrings.stock,
  //           selected: false,
  //         ),

  //         _buildNavItem(
  //           icon: Icons.shopping_cart_outlined,
  //           label: AppStrings.sales,
  //           selected: false,
  //         ),

  //         _buildNavItem(
  //           icon: Icons.person_outline,
  //           label: AppStrings.settings,
  //           selected: true,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildNavItem({
  //   required IconData icon,
  //   required String label,
  //   required bool selected,
  // }) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(
  //         icon,
  //         size: 25,
  //         color: selected ? AppColors.primaryColor : Colors.grey,
  //       ),

  //       const SizedBox(height: 2),

  //       Text(
  //         label,
  //         style: TextStyle(
  //           fontSize: 11,
  //           color: selected ? AppColors.primaryColor : Colors.grey,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
