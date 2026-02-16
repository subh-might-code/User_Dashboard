import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_theme.dart';

/// Custom AppBar for HDFC dashboard
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String customerName;
  final String customerId;

  const CustomAppBar({
    Key? key,
    required this.customerName,
    required this.customerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: AppTheme.primaryBlue,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing24,
        vertical: AppTheme.spacing12,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // HDFC Logo
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacing16,
                vertical: AppTheme.spacing8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // HDFC logo SVG
                  SvgPicture.asset(
                    'assets/images/hdfc-bank-logo.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'HDFC BANK',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            // Right side: Customer info and logout
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      customerName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Customer ID: $customerId',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppTheme.spacing12),
                // Avatar with initials
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Text(
                    'CN',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: AppTheme.spacing12),
                // Logout icon
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    // Logout action
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
