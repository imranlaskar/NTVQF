import 'package:flutter/material.dart';
import 'package:ntvqf/provider/quize_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizProvider>(create: (_) => QuizProvider()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}