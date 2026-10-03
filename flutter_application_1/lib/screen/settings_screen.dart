import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../resources/app_strings.dart';
import '../resources/app_text_size.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // TOP BAR
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,

        leading: const Icon(Icons.arrow_back, size: 32),

        title: Text(
          AppStrings.settings,
          style: TextStyle(
            fontSize: AppSizes.title,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // SETTINGS OPTIONS
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(38, 36, 28, 0),
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // PROFILE INFORMATION
                    _buildSettingTile(
                      icon: Icons.person_outline,
                      title: AppStrings.profileInformation,
                      onTap: () {},
                    ),

                    _buildDivider(),

                    // CHANGE PASSWORD
                    _buildSettingTile(
                      icon: Icons.lock_outline,
                      title: AppStrings.changePassword,
                      onTap: () {},
                    ),

                    _buildDivider(),

                    // NOTIFICATION
                    _buildNotificationTile(),

                    _buildDivider(),

                    // ABOUT APP
                    _buildSettingTile(
                      icon: Icons.info_outline,
                      title: AppStrings.aboutApp,
                      onTap: () {},
                    ),

                    _buildDivider(),

                    // LOGOUT
                    _buildSettingTile(
                      icon: Icons.logout,
                      title: AppStrings.logout,
                      isLogout: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          // BOTTOM NAVIGATION
          _buildBottomNavigation(),
        ],
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 63,
        child: Row(
          children: [
            const SizedBox(width: 14),

            Icon(icon, size: 28, color: isLogout ? Colors.red : Colors.black),

            const SizedBox(width: 20),

            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.body,
                fontWeight: FontWeight.w600,
                color: isLogout ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationTile() {
    return SizedBox(
      height: 63,
      child: Row(
        children: [
          const SizedBox(width: 14),

          const Icon(Icons.notifications_none, size: 28, color: Colors.black),

          const SizedBox(width: 20),

          Text(
            AppStrings.notification,
            style: TextStyle(
              fontSize: AppSizes.body,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          Switch(
            value: notificationEnabled,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            onChanged: (value) {
              setState(() {
                notificationEnabled = value;
              });
            },
          ),

          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey.shade300);
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            label: AppStrings.dashboard,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.inventory_2_outlined,
            label: AppStrings.product,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.inventory_2,
            label: AppStrings.stock,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.shopping_cart_outlined,
            label: AppStrings.sales,
            selected: false,
          ),

          _buildNavItem(
            icon: Icons.person_outline,
            label: AppStrings.settings,
            selected: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool selected,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 25,
          color: selected ? AppColors.primaryColor : Colors.grey,
        ),

        const SizedBox(height: 2),

        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: selected ? AppColors.primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}
