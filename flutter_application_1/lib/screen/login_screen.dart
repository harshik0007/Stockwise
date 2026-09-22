import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Used to validate the form
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 115),

              // Welcome
              const Text(
                AppStrings.welcomeBack,
                style: TextStyle(
                  fontSize: AppSizes.title,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                AppStrings.loginAccount,
                style: TextStyle(
                  fontSize: AppSizes.small,
                ),
              ),

              const SizedBox(height: 52),

              // Email label
              const Text(
                AppStrings.emailUsername,
                style: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Email field
              TextFormField(
                controller: emailController,

                decoration: InputDecoration(
                  hintText: 'abc@gmail.com',

                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.greyColor,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                // Email validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 5),

              // Password label
              const Text(
                AppStrings.password,
                style: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Password field
              TextFormField(
                controller: passwordController,

                obscureText: true,

                decoration: InputDecoration(
                  hintText: '***********',

                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.greyColor,
                  ),

                  suffixIcon: const Icon(
                    Icons.visibility_outlined,
                    color: AppColors.greyColor,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                // Password validation
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }

                  return null;
                },
              ),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {
                    // Forgot password
                  },

                  child: const Text(
                    AppStrings.forgotPassword,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 48,

                child: ElevatedButton(
                  onPressed: () {
                    print("LOGIN BUTTON CLICKED");

                    if (_formKey.currentState!.validate()) {
                      print("VALIDATION PASSED");
                    } else {
                      print("VALIDATION FAILED");
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.backgroundColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: const Text(
                    AppStrings.login,
                    style: TextStyle(
                      fontSize: AppSizes.body,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text(
                    AppStrings.noAccount,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // Sign up
                    },

                    child: const Text(
                      AppStrings.signUp,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}