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
      summary: "Recent research indicates that 30 minutes of daily exercise can significantly improve cardiovascular health and mental well-being.",
      category: "Fitness",
      readTime: "3 min read",
      imageUrl: "https://via.placeholder.com/300x200",
      publishedAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    NewsArticle(
      title: "Mental Health Awareness: Breaking the Stigma",
      summary: "Experts discuss the importance of mental health awareness and how to support those struggling with mental health issues.",
      category: "Mental Health",
      readTime: "5 min read",
      imageUrl: "https://via.placeholder.com/300x200",
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    NewsArticle(
      title: "Nutrition Tips for a Healthy Lifestyle",
      summary: "Learn about the essential nutrients your body needs and how to incorporate them into your daily diet effectively.",
      category: "Nutrition",
      readTime: "4 min read",
      imageUrl: "https://via.placeholder.com/300x200",
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    NewsArticle(
      title: "Sleep Hygiene: The Foundation of Good Health",
      summary: "Discover the importance of quality sleep and practical tips to improve your sleep hygiene for better overall health.",
      category: "Sleep",
      readTime: "6 min read",
      imageUrl: "https://via.placeholder.com/300x200",
      publishedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.backgroundGradient,
      ),
      child: Column(
        children: [
          // Enhanced Header with glassmorphism
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingXL),
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppTheme.borderRadiusXXLarge),
                bottomRight: Radius.circular(AppTheme.borderRadiusXXLarge),
              ),
              boxShadow: AppTheme.elevatedShadow,
            ),
            child: Row(
              children: [
                // Enhanced News icon with animation
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: Container(
                        padding: const EdgeInsets.all(AppTheme.spacingM),
                        decoration: BoxDecoration(
                          gradient: AppTheme.glassGradient,
                          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.article_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: AppTheme.spacingL),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health News',
                        style: AppTheme.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingXS),
                      Text(
                        'Stay updated with latest health insights',
                        style: AppTheme.bodyMedium.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Enhanced refresh button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Handle refresh
                    },
                    icon: const Icon(
                      Icons.refresh_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Enhanced Search bar
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingL),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.cardColor.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
                boxShadow: AppTheme.cardShadow,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search health news...',
                  hintStyle: AppTheme.bodyLarge.copyWith(
                    color: AppTheme.textTertiary,
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      color: AppTheme.textSecondary,
                      size: 24,
                    ),
                    onPressed: () {
                      // Handle search
                    },
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      color: AppTheme.textSecondary,
                      size: 24,
                    ),
                    onPressed: () {
                      // Handle filter
                    },
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingL,
                    vertical: AppTheme.spacingM,
                  ),
                ),
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),
          
          // News list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                return _buildNewsCard(_articles[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(NewsArticle article) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.only(bottom: AppTheme.spacingL),
              decoration: BoxDecoration(
                gradient: AppTheme.cardGradient,
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                boxShadow: AppTheme.cardShadow,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Enhanced Image placeholder with glassmorphism
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryColor.withValues(alpha: 0.2),
                          AppTheme.secondaryColor.withValues(alpha: 0.2),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                        topRight: Radius.circular(AppTheme.borderRadiusLarge),
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Background pattern
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: AppTheme.glassGradient,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppTheme.borderRadiusLarge),
                                topRight: Radius.circular(AppTheme.borderRadiusLarge),
                              ),
                            ),
                          ),
                        ),
                        // Content
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(AppTheme.spacingL),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusLarge),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 48,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: AppTheme.spacingM),
                              Text(
                                'Health News Image',
                                style: AppTheme.titleMedium.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Enhanced Content
                  Padding(
                    padding: const EdgeInsets.all(AppTheme.spacingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category and read time
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.spacingS,
                                vertical: AppTheme.spacingXS,
                              ),
                              decoration: BoxDecoration(
                                gradient: AppTheme.primaryGradient,
                                borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Text(
                                article.category,
                                style: AppTheme.labelMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppTheme.spacingS),
                            Text(
                              article.readTime,
                              style: AppTheme.labelSmall.copyWith(
                                color: AppTheme.textTertiary,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              _formatTime(article.publishedAt),
                              style: AppTheme.labelSmall.copyWith(
                                color: AppTheme.textTertiary,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: AppTheme.spacingM),
                        
                        // Title
                        Text(
                          article.title,
                          style: AppTheme.titleLarge.copyWith(
                            color: AppTheme.textPrimary,
                            height: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        const SizedBox(height: AppTheme.spacingS),
                        
                        // Summary
                        Text(
                          article.summary,
                          style: AppTheme.bodyLarge.copyWith(
                            color: AppTheme.textSecondary,
                            height: 1.5,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        const SizedBox(height: AppTheme.spacingL),
                        
                        // Enhanced Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: AppTheme.glassGradient,
                                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                                  border: Border.all(
                                    color: AppTheme.primaryColor.withValues(alpha: 0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // Handle read more
                                    },
                                    borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppTheme.spacingL,
                                        vertical: AppTheme.spacingM,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.read_more,
                                            size: 18,
                                            color: AppTheme.primaryColor,
                                          ),
                                          const SizedBox(width: AppTheme.spacingS),
                                          Text(
                                            'Read More',
                                            style: AppTheme.labelLarge.copyWith(
                                              color: AppTheme.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: AppTheme.spacingM),
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.cardColor.withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Handle bookmark
                                },
                                icon: Icon(
                                  Icons.bookmark_border,
                                  color: AppTheme.textSecondary,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppTheme.spacingS),
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.cardColor.withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  width: 1,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Handle share
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: AppTheme.textSecondary,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inHours < 1) {
      return 'Just now';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}';
    }
  }
}

class NewsArticle {
  final String title;
  final String summary;
  final String category;
  final String readTime;
  final String imageUrl;
  final DateTime publishedAt;

  NewsArticle({
    required this.title,
    required this.summary,
    required this.category,
    required this.readTime,
    required this.imageUrl,
    required this.publishedAt,
  });
}
