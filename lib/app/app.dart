import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:wordpair_generator/home/home.dart';
import 'package:wordpair_generator/repository/repository.dart';
import 'package:wordpair_generator/generator/generator.dart';
import 'package:wordpair_generator/favorites/favorites.dart';

class WordpairGeneratorApp extends StatelessWidget {
  const WordpairGeneratorApp({required this.favoritesRepository, super.key});

  final FavoritesRepository favoritesRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GeneratorBloc(
            favoritesRepository: favoritesRepository,
          )..add(RequestFavorites()),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(
            favoritesRepository: favoritesRepository,
          )..add(FavoritesLoaded()),
        )
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
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: HomePage(),
    );
  }
}
