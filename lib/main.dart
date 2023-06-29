import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wordpair_generator/app/app.dart';
import 'package:wordpair_generator/app/wordpair_generator_observer.dart';

void main() {
  Bloc.observer = const WordpairGeneratorObserver();
  runApp(WordpairGeneratorApp());
}
