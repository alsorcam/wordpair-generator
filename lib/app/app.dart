import 'package:flutter/material.dart';

import 'package:wordpair_generator/home/home.dart';

class WordpairGeneratorApp extends StatelessWidget {
  const WordpairGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordpair Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: HomeView(),
    );
  }
}
