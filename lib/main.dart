import 'package:book_store/app/constants/app_style.dart';
import 'package:book_store/app/provider/app_provider.dart';
import 'package:book_store/presentation/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: textTheme),
        home: const SpashScreen(),
      ),
    );
  }
}
