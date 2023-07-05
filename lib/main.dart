import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:wordpair_generator/app/app.dart';
import 'package:wordpair_generator/app/wordpair_generator_observer.dart';
import 'package:wordpair_generator/repository/repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final favoritesStorage = LocalStorageFavorites(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(favoritesStorage: favoritesStorage);
}

void bootstrap({required LocalStorageFavorites favoritesStorage}) {
  Bloc.observer = const WordpairGeneratorObserver();
  final favoritesRepository =
      FavoritesRepository(favoritesStorage: favoritesStorage);

  runZonedGuarded(
    () =>
        runApp(WordpairGeneratorApp(favoritesRepository: favoritesRepository)),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
