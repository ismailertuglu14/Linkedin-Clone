import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkedin_clone/views/landing_page/widgets/appbar.dart';

import 'views/landing_page/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Linkedin',
      home: LandingPage(),
    );
  }
}
