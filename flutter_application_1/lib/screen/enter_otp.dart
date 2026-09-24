import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/app_colors.dart';
import 'package:flutter_application_1/resources/app_strings.dart';
import 'package:flutter_application_1/resources/app_text_size.dart';


class EnterOtp extends StatefulWidget {
  const EnterOtp({super.key});

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> { 

  final _formKey = GlobalKey<FormState>();
  final TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50, 
          vertical: 10
        ),

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
                AppStrings.enterotp,
                style: TextStyle(
                  fontSize: AppSizes.title,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                AppStrings.next_line_of_enterotp,
                style: TextStyle(
                  fontSize: AppSizes.small,
                  // fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 50),

              const Text(
                AppStrings.otp,
                style: TextStyle(
                  fontSize: AppSizes.extraSmall,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // OTP field
              TextFormField(
                controller: otpcontroller,

                decoration: InputDecoration(
                  hintText: 'eg.123456',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                // VAlidation of otp field
                validator: (value) {
                  if (value == null || value.trim().isEmpty){
                    return 'Please enter OTP';
                  }

                  if (value.length != 6){
                    return 'OTP must be 6 digits';
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value)){
                    return 'OTP must contain only numbers';
                  }

                  return null;
                },
              ),

              
              

              const SizedBox(height: 25),

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

              const SizedBox(height: 25),

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

          )
        ),

      ),
    );
  }
}