import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wordpair_generator/home/home.dart';
import 'package:wordpair_generator/repository/repository.dart';

class WordpairGeneratorApp extends StatelessWidget {
  const WordpairGeneratorApp(
      {required this.favoritesRepository,
      required this.historyRepository,
      super.key});

  final FavoritesRepository favoritesRepository;
  final HistoryRepository historyRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: favoritesRepository,
        ),
        RepositoryProvider.value(
          value: historyRepository,
        ),
      ],
      child: const WordpairGeneratorView(),
    );
  }
}

class WordpairGeneratorView extends StatelessWidget {
  const WordpairGeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordpair Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: HomePage(),
    );
  }
}
