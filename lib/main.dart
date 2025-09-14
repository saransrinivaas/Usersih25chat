import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'components/main_page.dart';

void main() {
  runApp(const HealthChatbotApp());
}

class HealthChatbotApp extends StatelessWidget {
  const HealthChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainPage(),
    );
  }
}
