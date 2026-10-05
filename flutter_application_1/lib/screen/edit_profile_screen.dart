import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ==========================================================
  // CONTROLLERS
  // ==========================================================

  final TextEditingController usernameController = TextEditingController(
    text: 'Rohit',
  );

  final TextEditingController emailController = TextEditingController(
    text: 'abc@gmail.com',
  );

  final TextEditingController shopNameController = TextEditingController(
    text: 'XYZ Shop',
  );

  final TextEditingController phoneController = TextEditingController(
    text: '9999999999',
  );

  final TextEditingController passwordController = TextEditingController(
    text: 'password123',
  );

  // ==========================================================
  // PASSWORD VISIBILITY
  // ==========================================================

  bool passwordVisible = false;

  // ==========================================================
  // FORM KEY
  // ==========================================================

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    shopNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // ======================================================
      // APP BAR
      // ======================================================
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
          'Update Profile',

          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ======================================================
      // BODY
      // ======================================================
      body: SafeArea(
        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(45, 38, 45, 25),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ==================================================
                // USERNAME
                // ==================================================
                _buildLabel('Username'),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: usernameController,

                  hintText: 'Rohit',

                  prefixIcon: Icons.person_outline,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Username is required';
                    }

                    if (value.trim().length < 3) {
                      return 'Username must be at least 3 characters';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // EMAIL
                // ==================================================
                _buildLabel('Email'),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: emailController,

                  hintText: 'abc@gmail.com',

                  prefixIcon: Icons.email_outlined,

                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }

                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // SHOP NAME
                // ==================================================
                _buildLabel('Shop name'),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: shopNameController,

                  hintText: 'XYZ Shop',

                  prefixIcon: Icons.home_outlined,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Shop name is required';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // PHONE
                // ==================================================
                _buildLabel('Phone no.'),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: phoneController,

                  hintText: '9999999999',

                  prefixIcon: Icons.phone_outlined,

                  keyboardType: TextInputType.phone,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Phone number is required';
                    }

                    final phoneRegex = RegExp(r'^[0-9]{10}$');

                    if (!phoneRegex.hasMatch(value.trim())) {
                      return 'Enter a valid 10 digit phone number';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // PASSWORD
                // ==================================================
                _buildLabel('Password'),

                const SizedBox(height: 5),

                _buildPasswordField(),

                const SizedBox(height: 62),

                // ==================================================
                // UPDATE PROFILE BUTTON
                // ==================================================
                SizedBox(
                  width: double.infinity,
                  height: 49,

                  child: ElevatedButton(
                    onPressed: _updateProfile,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,

                      foregroundColor: Colors.white,

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),

                    child: Text(
                      'Update Profile',

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
      ),
    );
  }

  // ==========================================================
  // LABEL
  // ==========================================================

  Widget _buildLabel(String text) {
    return Text(
      text,

      style: TextStyle(
        fontSize: AppSizes.extraSmall,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ==========================================================
  // NORMAL TEXT FIELD
  // ==========================================================

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,

      keyboardType: keyboardType,

      validator: validator,

      style: const TextStyle(fontSize: 12),

      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),

        prefixIcon: Icon(prefixIcon, size: 22, color: Colors.grey.shade700),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),

        errorStyle: const TextStyle(fontSize: 10),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  // ==========================================================
  // PASSWORD FIELD
  // ==========================================================

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,

      obscureText: !passwordVisible,

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }

        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        return null;
      },

      style: const TextStyle(fontSize: 12),

      decoration: InputDecoration(
        hintText: '***********',

        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),

        prefixIcon: const Icon(
          Icons.lock_outline,
          size: 22,
          color: Colors.grey,
        ),

        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              passwordVisible = !passwordVisible;
            });
          },

          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,

            size: 20,

            color: Colors.grey.shade700,
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 10,
        ),

        errorStyle: const TextStyle(fontSize: 10),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: BorderSide(color: Colors.grey.shade500, width: 1.5),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),

          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  // ==========================================================
  // UPDATE PROFILE
  // ==========================================================

  void _updateProfile() {
    // Run all validations
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // If validation is successful
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );

    // Return to Profile screen after update
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }
}
