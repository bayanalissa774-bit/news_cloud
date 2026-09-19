import 'package:flutter/material.dart';
import 'package:news_cloud/models/news_model.dart';
import 'package:news_cloud/services/news_service.dart';

import 'news_details_page.dart';

class CategoryNewsPage extends StatefulWidget {
  final String categoryName;

  const CategoryNewsPage({
    super.key,
    required this.categoryName,
  });

  @override
  State<CategoryNewsPage> createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  late Future<List<NewsModel>> categoryNewsFuture;

  @override
  void initState() {
    super.initState();

    categoryNewsFuture = NewsService().fetchNews(
      category: widget.categoryName.toLowerCase(),
    );
  }

  void retryLoadingNews() {
    setState(() {
      categoryNewsFuture = NewsService().fetchNews(
        category: widget.categoryName.toLowerCase(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName} News'),
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: categoryNewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Failed to load news',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: retryLoadingNews,
                    child: const Text('Try again'),
                  ),
                ],
              ),
            );
          }

          final List<NewsModel> categoryNews = snapshot.data ?? <NewsModel>[];

          if (categoryNews.isEmpty) {
            return const Center(
              child: Text(
                'No news available',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: categoryNews.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 24);
            },
            itemBuilder: (context, index) {
              final NewsModel news = categoryNews[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailsPage(
                        image: news.image,
                        title: news.title,
                        category: news.category,
                        date: news.date,
                        content: news.content,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: news.image.isNotEmpty
                          ? Image.network(
                              news.image,
                              width: double.infinity,
                              height: 210,
                              fit: BoxFit.cover,
                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return buildImagePlaceholder();
                              },
                            )
                          : buildImagePlaceholder(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      news.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      news.date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildImagePlaceholder() {
    return Image.asset(
      'assets/images/default_news.jpg',
      width: double.infinity,
      height: 210,
      fit: BoxFit.cover,
    );
  }
}
