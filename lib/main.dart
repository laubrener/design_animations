import 'package:design/pages/sliver_list_page.dart';
import 'package:flutter/material.dart';
// import 'package:design/pages/emergency_page.dart';
// import 'package:design/pages/pinterest_page.dart';
// import 'package:design/pages/slideshow_page.dart';
// import 'package:design/pages/graficas_circulares_page.dart';
// import 'package:design/challenges/cuadrado_animado.dart';
// import 'package:design/pages/animations_page.dart';
// import 'package:design/pages/headers_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliverListPage(),
    );
  }
}
