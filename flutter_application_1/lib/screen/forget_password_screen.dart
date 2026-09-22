import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),


        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 80),

              // Back Arrow
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 

                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: AppColors.textColor,
                ),

                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),

              const SizedBox(height: 50),

              const Text(
                AppStrings.for_pass_title,
                style: TextStyle(
                  fontSize: AppSizes.title,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5,),

              const Text(
                AppStrings.next_line_of_fp,
                style: TextStyle(
                  fontSize: AppSizes.small, 
                  // fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 50),

              const Text(
                AppStrings.only_email,
                style: TextStyle(
                  fontSize: AppSizes.extraSmall, 
                  fontWeight: FontWeight.bold
                ),
              ),

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

              const SizedBox(height: 35,),

              // send otp button
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
                    AppStrings.send_otp,
                    style: TextStyle(
                      fontSize: AppSizes.body,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25,),

              // Back to login
              Align(
                alignment: Alignment.center,

                child: TextButton(
                  onPressed: () {
                    // back to login
                  },

                  child: const Text(
                    AppStrings.back_to_login,
                    style: TextStyle(
                      color: AppColors.primaryColor,
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