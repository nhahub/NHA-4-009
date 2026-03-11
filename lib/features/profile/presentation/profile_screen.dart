import 'package:flutter/material.dart';

import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_divider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.more, color: AppColors.lightGrey),
          onPressed: () {},
        ),
        title: const Text('الملف الشخصي', style: AppStyles.extraBold20),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: AppColors.lightGrey),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 12),
            CircleAvatar(
              radius: 56,
              backgroundColor: AppColors.lightGrey,
              backgroundImage: const AssetImage(AppAssets.avatar1),
            ),
            const SizedBox(height: 16),
            const Text('محمد أحمد', style: AppStyles.extraBold20),
            const SizedBox(height: 6),
            const Text('Eng_Mohamed@gmail.com', style: AppStyles.medium15),
            const SizedBox(height: 24),
            _buildOption(
              icon: Icons.person_2_outlined,
              title: 'تعديل الملف الشخصي',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            const CustomDivider(),
            const SizedBox(height: 8),
            _buildOption(icon: Icons.payment, title: 'الدفع', onTap: () {}),
            const SizedBox(height: 8),
            const CustomDivider(),
            const SizedBox(height: 8),
            _buildOption(
              icon: Icons.notifications,
              title: 'الإشعارات',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            const CustomDivider(),
            const SizedBox(height: 8),
            _buildOption(icon: Icons.security, title: 'الأمان', onTap: () {}),
            const SizedBox(height: 8),
            const CustomDivider(),
            const SizedBox(height: 8),
            _buildOption(
              icon: Icons.help_outline,
              title: 'مساعدة',
              onTap: () {},
            ),
            const SizedBox(height: 8),
            const CustomDivider(),
            const SizedBox(height: 16),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('الوضع الداكن', style: AppStyles.extraBold15),
              secondary: const Icon(Icons.dark_mode),
              value: _isDarkMode,
              onChanged: (value) => setState(() => _isDarkMode = value),
            ),
            const SizedBox(height: 8),
            const CustomDivider(),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkRed,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  'تسجيل الخروج',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: AppColors.bodyGray),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: AppStyles.extraBold15.copyWith(
                  color: AppColors.bodyGray,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.bodyGray,
            ),
          ],
        ),
      ),
    );
  }
}
