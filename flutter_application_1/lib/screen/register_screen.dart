import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // -------------------------------------------------------
  // FORM KEY
  // -------------------------------------------------------

  final _formKey = GlobalKey<FormState>();

  // -------------------------------------------------------
  // Controllers
  // -------------------------------------------------------

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final shopController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // -------------------------------------------------------
  // Password visibility
  // -------------------------------------------------------

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    shopController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),

                  // ------------------- TITLE -------------------
                  const Text(
                    AppStrings.registerhere,
                    style: TextStyle(
                      fontSize: AppSizes.title,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 3),

                  const Text(
                    AppStrings.registerfor__,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ---------------- USERNAME ----------------
                  const Text(
                    AppStrings.only_username,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  buildTextField(
                    controller: usernameController,
                    hintText: 'Rohit',
                    icon: Icons.person_outline,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter username';
                      }

                      if (value.trim().length < 3) {
                        return 'Username must be at least 3 characters';
                      }

                      if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
                        return 'Username can contain only letters';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 6),

                  // ---------------- EMAIL ----------------
                  const Text(
                    AppStrings.only_email,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  buildTextField(
                    controller: emailController,
                    hintText: 'abc@gmail.com',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter email';
                      }

                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );

                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 6),

                  // ---------------- SHOP NAME ----------------
                  const Text(
                    AppStrings.shopname,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  buildTextField(
                    controller: shopController,
                    hintText: 'XYZ Shop',
                    icon: Icons.home_outlined,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter shop name';
                      }

                      if (value.trim().length < 2) {
                        return 'Shop name must be at least 2 characters';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 6),

                  // ---------------- PHONE ----------------
                  const Text(
                    AppStrings.phoneNo,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  buildTextField(
                    controller: phoneController,
                    hintText: '+91 XXXXXXXXXX',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter phone number';
                      }

                      String phone = value.trim();

                      // Remove +91
                      if (phone.startsWith('+91')) {
                        phone = phone.substring(3);
                      }

                      // Remove spaces
                      phone = phone.replaceAll(' ', '');

                      // Check only numbers
                      if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
                        return 'Phone number can contain only numbers';
                      }

                      // Check 10 digits
                      if (phone.length != 10) {
                        return 'Phone number must be 10 digits';
                      }

                      // Indian number validation
                      if (!RegExp(r'^[6-9][0-9]{9}$').hasMatch(phone)) {
                        return 'Enter a valid phone number';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 6),

                  // ---------------- PASSWORD ----------------
                  const Text(
                    AppStrings.password,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  buildTextField(
                    controller: passwordController,
                    hintText: '***********',
                    icon: Icons.lock_outline,

                    obscureText: !isPasswordVisible,

                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.greyColor,
                      ),

                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }

                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }

                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password needs one uppercase letter';
                      }

                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password needs one lowercase letter';
                      }

                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password needs one number';
                      }

                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Password needs one special character';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 6),

                  // ---------------- CONFIRM PASSWORD ----------------
                  const Text(
                    AppStrings.conpassword,
                    style: TextStyle(
                      fontSize: AppSizes.small,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),

                  const SizedBox(height: 6),

                  buildTextField(
                    controller: confirmPasswordController,
                    hintText: '***********',
                    icon: Icons.lock_outline,

                    obscureText: !isConfirmPasswordVisible,

                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.greyColor,
                      ),

                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm password';
                      }

                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 35),

                  // ---------------- REGISTER BUTTON ----------------
                  SizedBox(
                    width: double.infinity,
                    height: 56,

                    child: ElevatedButton(
                      onPressed: registerUser,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.backgroundColor,
                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      child: const Text(
                        AppStrings.onlyregister,
                        style: TextStyle(
                          fontSize: AppSizes.body,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // =======================================================
  // TEXT FORM FIELD
  // =======================================================

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,

    required String? Function(String?) validator,

    bool obscureText = false,
    Widget? suffixIcon,

    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,

      obscureText: obscureText,

      keyboardType: keyboardType,

      validator: validator,

      style: const TextStyle(
        fontSize: AppSizes.small,
        color: AppColors.textColor,
      ),

      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 14),

        prefixIcon: Icon(icon, color: AppColors.greyColor, size: 25),

        suffixIcon: suffixIcon,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),

        // Normal border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

          borderSide: const BorderSide(color: AppColors.greyColor, width: 2),
        ),

        // Focused border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),

        // Error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),

        // Focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  // =======================================================
  // REGISTER FUNCTION
  // =======================================================

  void registerUser() {
    // Run all validation
    if (_formKey.currentState!.validate()) {
      // All fields are valid

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registration successful!')));

      print('Username: ${usernameController.text}');
      print('Email: ${emailController.text}');
      print('Shop Name: ${shopController.text}');
      print('Phone: ${phoneController.text}');
    }
  }
}
