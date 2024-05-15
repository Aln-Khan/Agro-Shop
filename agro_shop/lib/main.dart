// ignore_for_file: unused_import

import 'package:agro_shop/firebase_options.dart';
import 'package:agro_shop/screens/intro_screen.dart';
import 'package:agro_shop/screens/root_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Agro Shop',
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
