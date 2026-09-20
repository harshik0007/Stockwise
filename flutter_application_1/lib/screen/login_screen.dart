import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,

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
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 52),

              // Email label
              const Text(
                'Email / Username',
                style: TextStyle(
                  fontSize: 13,
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
                    color: Colors.grey,
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
                'Password',
                style: TextStyle(
                  fontSize: 13,
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
                    color: Colors.grey,
                  ),

                  suffixIcon: const Icon(
                    Icons.visibility_outlined,
                    color: Colors.grey,
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
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
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
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
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
                    "Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // Sign up
                    },

                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.blue,
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