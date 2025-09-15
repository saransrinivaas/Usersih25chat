import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.backgroundColor,
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Column(
          children: [
            // Elegant Header
            _buildHeader(),
            // Menu Items
            Expanded(
              child: _buildMenuItems(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned(
            top: -30,
            right: -30,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // App Logo
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppTheme.lilacGradient,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.health_and_safety,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),
                // App Info
                Text(
                  'Health Assistant',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your wellness companion',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    final menuItems = [
      MenuItem(
        title: 'Dashboard',
        subtitle: 'Overview of your health',
        icon: Icons.dashboard,
        color: AppTheme.accentColor,
      ),
      MenuItem(
        title: 'Chat',
        subtitle: 'Talk to AI assistant',
        icon: Icons.chat,
        color: AppTheme.secondaryColor,
      ),
      MenuItem(
        title: 'News',
        subtitle: 'Latest health updates',
        icon: Icons.article,
        color: AppTheme.infoColor,
      ),
      MenuItem(
        title: 'Games',
        subtitle: 'Health quizzes & games',
        icon: Icons.games,
        color: AppTheme.successColor,
      ),
      MenuItem(
        title: 'Profile',
        subtitle: 'Your personal settings',
        icon: Icons.person,
        color: AppTheme.accentLight,
      ),
    ];

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Main Menu Items
        ...menuItems.map((item) => _buildMenuItem(context, item)),
        
        const SizedBox(height: 20),
        
        // Divider
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppTheme.textTertiary.withValues(alpha: 0.3),
                Colors.transparent,
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 20),
        
        // Additional Menu Items
        _buildMenuItem(
          context,
          MenuItem(
            title: 'Settings',
            subtitle: 'App preferences',
            icon: Icons.settings,
            color: AppTheme.textSecondary,
          ),
        ),
        _buildMenuItem(
          context,
          MenuItem(
            title: 'Help & Support',
            subtitle: 'Get assistance',
            icon: Icons.help_outline,
            color: AppTheme.textSecondary,
          ),
        ),
        _buildMenuItem(
          context,
          MenuItem(
            title: 'About',
            subtitle: 'App information',
            icon: Icons.info_outline,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            // Handle navigation
          },
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        item.color.withValues(alpha: 0.2),
                        item.color.withValues(alpha: 0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    item.icon,
                    color: item.color,
                    size: 20,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Arrow
                Icon(
                  Icons.chevron_right,
                  color: AppTheme.textTertiary,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  MenuItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}
