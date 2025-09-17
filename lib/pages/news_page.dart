import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<NewsArticle> _articles = [
    NewsArticle(
      title: "New Study Shows Benefits of Regular Exercise",
      summary: "Recent research indicates that 30 minutes of daily exercise can significantly improve cardiovascular health.",
      category: "Fitness",
      readTime: "3 min read",
      publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NewsArticle(
      title: "Mental Health Awareness: Breaking the Stigma",
      summary: "Experts discuss the importance of mental health awareness and how to support those struggling.",
      category: "Mental Health",
      readTime: "5 min read",
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NewsArticle(
      title: "Nutrition Tips for a Healthy Lifestyle",
      summary: "Learn about the essential nutrients your body needs and how to incorporate them effectively.",
      category: "Nutrition",
      readTime: "4 min read",
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    NewsArticle(
      title: "Sleep Hygiene: The Foundation of Good Health",
      summary: "Discover the importance of quality sleep and practical tips to improve your sleep hygiene.",
      category: "Sleep",
      readTime: "6 min read",
      publishedAt: DateTime.now().subtract(const Duration(days: 3)),
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
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          return _buildArticleCard(_articles[index]);
        },
      ),
    );
  }

  Widget _buildArticleCard(NewsArticle article) {
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
            // Handle article tap
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category and Read Time
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        gradient: AppTheme.lilacGradient,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        article.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      article.readTime,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textTertiary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Title
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                // Summary
                Text(
                  article.summary,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textSecondary,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                // Time and Read More
                Row(
                  children: [
                    Text(
                      _formatTime(article.publishedAt),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textTertiary,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppTheme.accentColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Read More',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.accentColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}

class NewsArticle {
  final String title;
  final String summary;
  final String category;
  final String readTime;
  final DateTime publishedAt;

  NewsArticle({
    required this.title,
    required this.summary,
    required this.category,
    required this.readTime,
    required this.publishedAt,
  });
}