import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, this.initialProfileImage});

  final XFile? initialProfileImage;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ==========================================================
  // CONTROLLERS
  // ==========================================================

  final TextEditingController fullNameController = TextEditingController(
    text: 'Rohit Sharma',
  );

  final TextEditingController locationController = TextEditingController(
    text: 'Mumbai, India',
  );

  final TextEditingController profileImageNameController =
      TextEditingController();

  final TextEditingController usernameController = TextEditingController(
    text: 'rohit',
  );

  final TextEditingController emailController = TextEditingController(
    text: 'owner@example.com',
  );

  final TextEditingController shopNameController = TextEditingController(
    text: 'XYZ Shop',
  );

  final TextEditingController phoneController = TextEditingController(
    text: '9876543210',
  );

  XFile? profileImage;

  @override
  void initState() {
    super.initState();
    profileImage = widget.initialProfileImage;
    profileImageNameController.text = profileImage?.name ?? '';
  }

  Future<void> _selectProfileImage() async {
    final selectedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (selectedImage != null && mounted) {
      setState(() {
        profileImage = selectedImage;
        profileImageNameController.text = selectedImage.name;
      });
    }
  }

  // ==========================================================
  // ==========================================================
  // FORM KEY
  // ==========================================================

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    locationController.dispose();
    profileImageNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    shopNameController.dispose();
    phoneController.dispose();

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
          AppStrings.updateProfile,
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
                _buildLabel(AppStrings.profileImage),

                const SizedBox(height: 5),

                _buildImageField(),

                const SizedBox(height: 5),

                // ==================================================
                // FULL NAME
                // ==================================================
                _buildLabel(AppStrings.fullName),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: fullNameController,
                  hintText: AppStrings.fullName,
                  prefixIcon: Icons.person_outline,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Please enter full name'
                      : null,
                ),

                const SizedBox(height: 5),

                // ==================================================
                // USERNAME
                // ==================================================
                _buildLabel(AppStrings.username),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: usernameController,

                  hintText: AppStrings.usernameHint,

                  prefixIcon: Icons.person_outline,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.usernameRequired;
                    }

                    if (value.trim().length < 3) {
                      return AppStrings.usernameMinLength;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // EMAIL
                // ==================================================
                _buildLabel(AppStrings.email),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: emailController,

                  hintText: AppStrings.emailHint,

                  prefixIcon: Icons.email_outlined,

                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.emailRequired;
                    }

                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return AppStrings.validEmail;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // PHONE
                // ==================================================
                _buildLabel(AppStrings.phoneNumber),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: phoneController,

                  hintText: AppStrings.phoneNumberHint,

                  prefixIcon: Icons.phone_outlined,

                  keyboardType: TextInputType.phone,

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.phoneRequired;
                    }

                    final phoneRegex = RegExp(r'^[0-9]{10}$');

                    if (!phoneRegex.hasMatch(value.trim())) {
                      return AppStrings.validPhone;
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // SHOP NAME
                // ==================================================
                _buildLabel(AppStrings.shopNameLabel),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: shopNameController,
                  hintText: AppStrings.shopNameHint,
                  prefixIcon: Icons.home_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppStrings.shopNameRequired;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 5),

                // ==================================================
                // LOCATION
                // ==================================================
                _buildLabel(AppStrings.location),

                const SizedBox(height: 5),

                _buildTextField(
                  controller: locationController,
                  hintText: AppStrings.location,
                  prefixIcon: Icons.location_on_outlined,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Please enter location'
                      : null,
                ),

                const SizedBox(height: 5),

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
                      AppStrings.updateProfile,

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

  Widget _buildImageField() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: _buildTextField(
        controller: profileImageNameController,
        hintText: AppStrings.uploadProfileImage,
        prefixIcon: Icons.upload_file_outlined,
        validator: (_) => null,
        readOnly: true,
        onTap: _selectProfileImage,
        suffixIcon: profileImage == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FutureBuilder(
                    future: profileImage!.readAsBytes(),
                    builder: (context, snapshot) => SizedBox(
                      width: 25,
                      height: 25,
                      child: snapshot.hasData
                          ? Image.memory(snapshot.data!, fit: BoxFit.cover)
                          : const Icon(Icons.image_outlined, size: 20),
                    ),
                  ),
                  IconButton(
                    constraints: const BoxConstraints.tightFor(
                      width: 32,
                      height: 32,
                    ),
                    padding: EdgeInsets.zero,
                    tooltip: AppStrings.removeImage,
                    onPressed: () => setState(() {
                      profileImage = null;
                      profileImageNameController.clear();
                    }),
                    icon: const Icon(Icons.close, size: 18),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool readOnly = false,
    VoidCallback? onTap,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,

      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,

      validator: validator,

      style: const TextStyle(fontSize: 12),

      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),

        prefixIcon: Icon(prefixIcon, size: 22, color: Colors.grey),

        suffixIcon: suffixIcon,

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
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text(AppStrings.profileUpdated)));

    // Return to Profile screen after update
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        Navigator.pop(context, {'image': profileImage});
      }
    });
  }
}
