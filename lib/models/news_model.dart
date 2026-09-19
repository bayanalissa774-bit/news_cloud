class NewsModel {
  final String image;
  final String title;
  final String description;
  final String content;
  final String category;
  final String date;

  const NewsModel({
    required this.image,
    required this.title,
    required this.description,
    required this.content,
    required this.category,
    required this.date,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    final String description =
        json['description']?.toString() ?? 'No description available';

    final String? apiContent = json['content']?.toString();

    final String content;

    if (apiContent == null ||
        apiContent.trim().isEmpty ||
        apiContent.contains('ONLY AVAILABLE IN PAID PLANS')) {
      content = description;
    } else {
      content = apiContent;
    }

    return NewsModel(
      image: json['image_url']?.toString() ?? '',
      title: json['title']?.toString() ?? 'No title',
      description: description,
      content: content,
      category: (json['category'] as List?)?.join(', ') ?? 'General',
      date: json['pubDate']?.toString() ?? '',
    );
  }
}
