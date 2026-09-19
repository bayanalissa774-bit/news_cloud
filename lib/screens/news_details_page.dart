import 'package:flutter/material.dart';

class NewsDetailsPage extends StatefulWidget {
  final String image;
  final String title;
  final String category;
  final String date;
  final String content;
  const NewsDetailsPage(
      {super.key,
      required this.image,
      required this.title,
      required this.category,
      required this.date,
      required this.content});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: widget.image.isNotEmpty
                    ? Image.network(
                        widget.image,
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/default_news.jpg',
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/default_news.jpg',
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, height: 1.5),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.category_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    widget.category,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    widget.date,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  widget.content,
                  maxLines: isExpanded ? null : 2,
                  overflow:
                      isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.7,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
