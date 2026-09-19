// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:news_cloud/screens/news_details_page.dart';
import 'package:news_cloud/screens/category_news_page.dart';
import 'package:flutter/gestures.dart';
import 'package:news_cloud/services/news_service.dart';
import 'package:news_cloud/models/news_model.dart';

class NewsHomePage extends StatefulWidget {
  const NewsHomePage({super.key});

  @override
  State<NewsHomePage> createState() => _NewsHomePageState();
}

class _NewsHomePageState extends State<NewsHomePage> {
  late Future<List<NewsModel>> generalNewsFuture;
  // ignore: annotate_overrides
  void initState() {
    super.initState();
    generalNewsFuture = NewsService().fetchNews(
      category: 'top',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'News',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Cloud',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 120,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryNewsPage(
                                    categoryName: "Business"),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "assets/images/business1.jpg",
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.25),
                                ),
                                const Center(
                                  child: Text(
                                    "Business",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryNewsPage(
                                    categoryName: "Entertainment"),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  "assets/images/entertainment1.jpg",
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.25),
                                ),
                                const Center(
                                  child: Text(
                                    'Entertainment',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryNewsPage(
                                  categoryName: 'Sports',
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  'assets/images/sports1.jpg',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.25),
                                ),
                                const Center(
                                  child: Text(
                                    'Sports',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryNewsPage(
                                  categoryName: 'Health',
                                ),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  'assets/images/health1.jpg',
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.25),
                                ),
                                const Center(
                                  child: Text(
                                    'Health',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "General News",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder<List<NewsModel>>(
                future: generalNewsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        'Failed to load news',
                      ),
                    );
                  }

                  final newsList = (snapshot.data ?? [])
                      .where((news) => news.image.trim().isNotEmpty)
                      .toList();

                  if (newsList.isEmpty) {
                    return const Center(
                      child: Text(
                        'No news available',
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newsList.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 24);
                    },
                    itemBuilder: (context, index) {
                      final news = newsList[index];

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
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          width: double.infinity,
                                          height: 210,
                                          color: Colors.grey.shade200,
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.image_not_supported_outlined,
                                            size: 45,
                                            color: Colors.grey,
                                          ),
                                        );
                                      },
                                    )
                                  : Container(
                                      width: double.infinity,
                                      height: 210,
                                      color: Colors.grey.shade200,
                                      alignment: Alignment.center,
                                      child: const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 45,
                                        color: Colors.grey,
                                      ),
                                    ),
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
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// الخطوة الأولى فقط: الحصول على API Key
// افتح موقع NewsData.io.
// اضغط Get API Key أو Sign Up.
// أنشئ حسابًا مجانيًا.
// اعمل التالي:

// اضغط زر القائمة ☰ الموجود أعلى يمين الموقع.
// ادخل إلى Dashboard.
// افتح قسم API Key أو API Keys.
// انسخ المفتاح الافتراضي الموجود هناك. NewsData.io ينشئ مفتاحًا افتراضيًا داخل لوحة الحساب بعد تسجيل الدخول.


// ربط الـAPI — الخطوة الأولى فقط

// بما أنك نسخت مفتاح NewsData.io، الآن سنضيف مكتبة http إلى المشروع. هذه المكتبة مسؤولة عن إرسال طلب الإنترنت إلى NewsData.io واستقبال الرد. وهي مكتبة Dart الرسمية متعددة المنصات لطلبات HTTP.
  
//   افتح الـTerminal داخل مشروعك، وتأكد أن المسار ينتهي باسم المشروع:

// ...\news_cloud>

// ثم اكتب:

// flutter pub add http

// بعد انتهاء الأمر، يجب أن ترى رسالة قريبة من:

// Changed 1 dependency!

// وسوف يُضاف تلقائيًا داخل pubspec.yaml:

// dependencies:
//   http: ...

// لا تعدّل رقم الإصدار يدويًا.
// مكتبة http هي التي سنستخدمها لاحقًا لإرسال طلب إلى endpoint الأخبار الحديثة في NewsData.io، والذي يعتمد على apikey للمصادقة
//   عني مكتبة http انضافت للمشروع بنجاح. أما رسالة وجود نسخ أحدث للحزم فهي ملاحظة فقط وليست خطأ، فلا تعدّل شيئًا حاليًا.

// مكتبة http هي التي سنستخدمها لإرسال الطلب إلى NewsData.io واستقبال الرد.
//   // pub_0036a433ae1e4f30a406c754dd7b3874

// Changed 4 dependencies!

// يعني مكتبة http انضافت للمشروع بنجاح. أما رسالة وجود نسخ أحدث للحزم فهي ملاحظة فقط وليست خطأ، فلا تعدّل شيئًا حاليًا.

// الخطوة الثانية فقط: إنشاء ملف خدمة الـAPI

// داخل مجلد lib أنشئ مجلدًا جديدًا اسمه:

// services

// وداخل services أنشئ ملفًا اسمه:

// news_service.dart

// ليصبح ترتيب المشروع:

// lib/
// ├── models/
// ├── screens/
// ├── services/
// │   └── news_service.dart
// └── main.dart

// داخل ملف news_service.dart اكتب فقط هذين السطرين:

// import 'dart:convert';

// import 'package:http/http.dart' as http;