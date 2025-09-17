import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final List<GameItem> _games = [
    GameItem(
      title: "Health Quiz",
      description: "Test your health knowledge",
      icon: Icons.quiz,
      difficulty: "Easy",
      duration: "5 min",
      color: AppTheme.accentColor,
    ),
    GameItem(
      title: "Nutrition Challenge",
      description: "Learn healthy eating",
      icon: Icons.restaurant,
      difficulty: "Medium",
      duration: "10 min",
      color: AppTheme.secondaryColor,
    ),
    GameItem(
      title: "Exercise Memory",
      description: "Match exercise cards",
      icon: Icons.fitness_center,
      difficulty: "Hard",
      duration: "15 min",
      color: AppTheme.successColor,
    ),
    GameItem(
      title: "Mental Health Check",
      description: "Assess your well-being",
      icon: Icons.psychology,
      difficulty: "Easy",
      duration: "8 min",
      color: AppTheme.infoColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.backgroundGradient,
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _games.length,
        itemBuilder: (context, index) {
          return _buildGameCard(_games[index]);
        },
      ),
    );
  }

  Widget _buildGameCard(GameItem game) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle game tap
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Game Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [game.color, game.color.withValues(alpha: 0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    game.icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                // Game Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        game.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: game.color.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              game.difficulty,
                              style: TextStyle(
                                fontSize: 12,
                                color: game.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            game.duration,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Play Button
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: AppTheme.lilacGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GameItem {
  final String title;
  final String description;
  final IconData icon;
  final String difficulty;
  final String duration;
  final Color color;

  GameItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.difficulty,
    required this.duration,
    required this.color,
  });
}