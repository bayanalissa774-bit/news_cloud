// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'screens/news_home_page.dart';
import 'services/news_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const NewsCloudApp());
}

class NewsCloudApp extends StatelessWidget {
  const NewsCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NewsHomePage(),
    );
  }
}
