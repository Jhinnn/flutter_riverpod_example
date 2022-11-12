import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/home.dart';
import 'package:flutter_riverpod_example/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(ProviderScope(
      child: GetMaterialApp(
    home: const MyApp(),
    getPages: AppPages.routes,
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 40)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 12, color: Colors.white)),
                  backgroundColor: MaterialStateProperty.all(Colors.green))),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 40)),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(fontSize: 12, color: Colors.white)),
                  backgroundColor: MaterialStateProperty.all(Colors.green)))),
    );
  }
}

class MyWidget extends StatelessWidget {
  final VoidCallback voidCallback;
  final String title;
  const MyWidget({super.key, required this.voidCallback, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => voidCallback(),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(title),
        ),
      ),
    );
  }
}
