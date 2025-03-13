import 'package:bookworm/core/models/books_model.dart';
import 'package:bookworm/core/models/user_model.dart';
import 'package:bookworm/core/services/local_database.dart';
import 'package:bookworm/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BooksAdapter()); // Registering Books Adapter for Hive
  Hive.registerAdapter(UserModelAdapter()); // Registering User Adapter for Hive
  await LocalDatabase.openLocalDB(); // Opening the hive boxes

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookworm',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
