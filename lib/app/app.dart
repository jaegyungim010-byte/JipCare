import 'package:flutter/material.dart';

import '../features/home/home_page.dart';
import 'theme/jip_care_theme.dart';

class JipCareApp extends StatelessWidget {
  const JipCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '집케어',
      theme: JipCareTheme.light,
      home: const HomePage(),
    );
  }
}
