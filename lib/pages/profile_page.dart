import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserProfile _userProfile = UserProfile(
    name: "John Doe",
    email: "john.doe@example.com",
    avatar: "https://via.placeholder.com/150",
    joinDate: DateTime.now().subtract(const Duration(days: 30)),
    healthScore: 85,
    gamesPlayed: 12,
    articlesRead: 8,
    streak: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.backgroundGradient,
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Profile',
                        style: AppTheme.headingSmall.copyWith(color: Colors.white),
                      ),
                      Text(
                        'Manage your health journey',
                        style: AppTheme.bodySmall.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Handle edit profile
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
          // Profile content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Profile card
                  _buildProfileCard(),
                  
                  const SizedBox(height: 24),
                  
                  // Stats section
                  _buildStatsSection(),
                  
                  const SizedBox(height: 24),
                  
                  // Menu items
                  _buildMenuSection(),
                  
                  const SizedBox(height: 24),
                  
                  // Settings section
                  _buildSettingsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppTheme.cardColor,
              child: CircleAvatar(
                radius: 36,
                backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
                child: Text(
                  _userProfile.name.substring(0, 1).toUpperCase(),
                  style: AppTheme.headingLarge.copyWith(
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Name and email
          Text(
            _userProfile.name,
            style: AppTheme.headingMedium.copyWith(
              color: AppTheme.textPrimary,
            ),
          ),
          
          const SizedBox(height: 4),
          
          Text(
            _userProfile.email,
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.textSecondary,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Health score
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.successColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.successColor.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  color: AppTheme.successColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Health Score: ${_userProfile.healthScore}',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.successColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Progress',
            style: AppTheme.headingSmall.copyWith(
              color: AppTheme.textPrimary,
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  'Games Played',
                  _userProfile.gamesPlayed.toString(),
                  Icons.videogame_asset,
                  AppTheme.primaryColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Articles Read',
                  _userProfile.articlesRead.toString(),
                  Icons.article,
                  AppTheme.secondaryColor,
                ),
              ),
              Expanded(
                child: _buildStatItem(
                  'Day Streak',
                  _userProfile.streak.toString(),
                  Icons.local_fire_department,
                  AppTheme.warningColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTheme.headingMedium.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTheme.caption.copyWith(
            color: AppTheme.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMenuSection() {
    final menuItems = [
      MenuItem(
        title: 'Health History',
        subtitle: 'View your health journey',
        icon: Icons.history,
        color: AppTheme.primaryColor,
      ),
      MenuItem(
        title: 'Achievements',
        subtitle: 'Your health milestones',
        icon: Icons.emoji_events,
        color: AppTheme.warningColor,
      ),
      MenuItem(
        title: 'Favorites',
        subtitle: 'Saved articles and games',
        icon: Icons.favorite,
        color: AppTheme.errorColor,
      ),
      MenuItem(
        title: 'Notifications',
        subtitle: 'Manage your alerts',
        icon: Icons.notifications,
        color: AppTheme.secondaryColor,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Access',
          style: AppTheme.headingSmall.copyWith(
            color: AppTheme.textPrimary,
          ),
        ),
        
        const SizedBox(height: 12),
        
        ...menuItems.map((item) => _buildMenuItem(item)),
      ],
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle menu item tap
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: item.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    item.icon,
                    color: item.color,
                    size: 20,
                  ),
                ),
                
                const SizedBox(width: 16),
                
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: AppTheme.bodyLarge.copyWith(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        item.subtitle,
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                
                Icon(
                  Icons.chevron_right,
                  color: AppTheme.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection() {
    final settingsItems = [
      SettingsItem(
        title: 'Privacy Settings',
        icon: Icons.privacy_tip,
      ),
      SettingsItem(
        title: 'Account Settings',
        icon: Icons.account_circle,
      ),
      SettingsItem(
        title: 'Help & Support',
        icon: Icons.help,
      ),
      SettingsItem(
        title: 'About',
        icon: Icons.info,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: AppTheme.headingSmall.copyWith(
            color: AppTheme.textPrimary,
          ),
        ),
        
        const SizedBox(height: 12),
        
        ...settingsItems.map((item) => _buildSettingsItem(item)),
      ],
    );
  }

  Widget _buildSettingsItem(SettingsItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle settings item tap
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color: AppTheme.textSecondary,
                  size: 20,
                ),
                
                const SizedBox(width: 16),
                
                Expanded(
                  child: Text(
                    item.title,
                    style: AppTheme.bodyLarge.copyWith(
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
                
                Icon(
                  Icons.chevron_right,
                  color: AppTheme.textSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String avatar;
  final DateTime joinDate;
  final int healthScore;
  final int gamesPlayed;
  final int articlesRead;
  final int streak;

  UserProfile({
    required this.name,
    required this.email,
    required this.avatar,
    required this.joinDate,
    required this.healthScore,
    required this.gamesPlayed,
    required this.articlesRead,
    required this.streak,
  });
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

class SettingsItem {
  final String title;
  final IconData icon;

  SettingsItem({
    required this.title,
    required this.icon,
  });
}
