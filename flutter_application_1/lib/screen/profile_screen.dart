import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/edit_profile_screen.dart';

import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // =====================================================
      // APP BAR
      // =====================================================
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
          AppStrings.profile,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =====================================================
      // BODY
      // =====================================================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),

          child: Column(
            children: [
              const SizedBox(height: 45),

              // =================================================
              // PROFILE IMAGE
              // =================================================
              CircleAvatar(
                radius: 57,

                backgroundColor: const Color(0xFFA8D0FF),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    // Head
                    Container(
                      width: 40,
                      height: 40,

                      decoration: const BoxDecoration(
                        color: Color(0xFF0874E8),
                        shape: BoxShape.circle,
                      ),
                    ),

                    // Body
                    Container(
                      width: 70,
                      height: 40,

                      decoration: const BoxDecoration(
                        color: Color(0xFF0874E8),

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // OWNER NAME
              // =================================================
              const Text(
                AppStrings.ownerName,

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4),

              // =================================================
              // ROLE
              // =================================================
              const Text(
                AppStrings.role,

                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 20),

              // =================================================
              // PROFILE INFORMATION CARD
              // =================================================
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  border: Border.all(color: Colors.grey.shade500, width: 1),
                ),

                child: Column(
                  children: [
                    // SHOP NAME
                    _buildProfileRow(
                      icon: Icons.home_outlined,
                      title: AppStrings.shopName,
                      value: AppStrings.example,
                    ),

                    Divider(height: 1, color: Colors.grey.shade400),

                    // EMAIL
                    _buildProfileRow(
                      icon: Icons.email_outlined,
                      title: AppStrings.email,
                      value: AppStrings.ownerEmail,
                    ),

                    Divider(height: 1, color: Colors.grey.shade400),

                    // PHONE
                    _buildProfileRow(
                      icon: Icons.phone_outlined,
                      title: AppStrings.phone,
                      value: AppStrings.ownerPhone,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 56),

              // =================================================
              // EDIT PROFILE BUTTON
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 40,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    );
                  },

                  icon: const SizedBox.shrink(),

                  label: const Text(AppStrings.editProfile),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 9),

              // =================================================
              // LOGOUT BUTTON
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 40,

                child: ElevatedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context);
                  },

                  icon: const Icon(Icons.logout, size: 18),

                  label: const Text(AppStrings.logout),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // PROFILE INFORMATION ROW
  // ==========================================================

  Widget _buildProfileRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return SizedBox(
      height: 59,

      child: Row(
        children: [
          const SizedBox(width: 15),

          Icon(icon, size: 25, color: Colors.black87),

          const SizedBox(width: 12),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                value,

                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // LOGOUT CONFIRMATION
  // ==========================================================

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,

      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(AppStrings.logout),

          content: const Text(AppStrings.logoutConfirmation),

          actions: [
            // CANCEL
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },

              child: const Text(AppStrings.cancel),
            ),

            // LOGOUT
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                // Logout logic will be added later.
              },

              child: const Text(
                AppStrings.logout,

                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
