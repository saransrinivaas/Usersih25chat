import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../pages/chat_page.dart';
import '../pages/news_page.dart';
import '../pages/games_page.dart';
import '../pages/profile_page.dart';
import 'app_sidebar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _currentLanguage = 'EN';

  final List<Widget> _pages = const [
    ChatPage(),
    NewsPage(),
    GamesPage(),
    ProfilePage(),
  ];

  final List<NavItem> _navItems = [
    NavItem(icon: Icons.chat, label: 'Chat'),
    NavItem(icon: Icons.article, label: 'News'),
    NavItem(icon: Icons.games, label: 'Games'),
    NavItem(icon: Icons.person, label: 'Profile'),
  ];

  final List<Map<String, String>> _languages = [
    {'code': 'EN', 'name': 'English'},
    {'code': 'HI', 'name': 'हिन्दी'},
    {'code': 'TA', 'name': 'தமிழ்'},
    {'code': 'OR', 'name': 'ଓଡ଼ିଆ'},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightThemeData,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppTheme.lightBackgroundColor,
        drawer: const AppSidebar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: AppTheme.lightPrimaryGradient,
          ),
        child: SafeArea(
          child: Column(
            children: [
              // Minimal Header
              _buildHeader(),
              // Main Content
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppTheme.lightBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: _pages[_currentIndex],
                    ),
                  ),
                ),
              ),
              // Floating Navigation
              _buildFloatingNavigation(),
            ],
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          // Menu Button
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // App Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: AppTheme.lilacGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.health_and_safety,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _navItems[_currentIndex].label,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Health Assistant',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Language Switcher
          PopupMenuButton<String>(
            onSelected: (String languageCode) {
              setState(() {
                _currentLanguage = languageCode;
              });
            },
            itemBuilder: (BuildContext context) {
              return _languages.map((language) {
                return PopupMenuItem<String>(
                  value: language['code']!,
                  child: Row(
                    children: [
                      Text(
                        language['name']!,
                        style: TextStyle(
                          color: _currentLanguage == language['code'] 
                              ? AppTheme.accentColor 
                              : AppTheme.textPrimary,
                          fontWeight: _currentLanguage == language['code'] 
                              ? FontWeight.w600 
                              : FontWeight.w400,
                        ),
                      ),
                      if (_currentLanguage == language['code']) ...[
                        const Spacer(),
                        Icon(
                          Icons.check,
                          color: AppTheme.accentColor,
                          size: 16,
                        ),
                      ],
                    ],
                  ),
                );
              }).toList();
            },
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _currentLanguage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingNavigation() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      height: 70,
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _navItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == _currentIndex;
          
          return GestureDetector(
            onTap: () => _onTabTapped(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isSelected ? 60 : 50,
              height: isSelected ? 60 : 50,
              decoration: BoxDecoration(
                gradient: isSelected ? AppTheme.lilacGradient : null,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isSelected ? [
                  BoxShadow(
                    color: AppTheme.accentColor.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ] : null,
              ),
              child: Icon(
                item.icon,
                color: isSelected ? Colors.white : AppTheme.textTertiary,
                size: isSelected ? 24 : 22,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  NavItem({
    required this.icon,
    required this.label,
  });
}
