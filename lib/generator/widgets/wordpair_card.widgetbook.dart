import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'package:wordpair_generator/generator/widgets/widgets.dart';

@UseCase(
  name: 'Big card',
  type: Card,
)
wordPairCardUseCase(BuildContext context) {
  var firstWord = context.knobs.string(
    label: 'First word',
    initialValue: 'big',
  );
  var secondWord = context.knobs.string(
    label: 'Second word',
    initialValue: 'card',
  );
  return firstWord.isEmpty || secondWord.isEmpty
      ? Text('Error: Words can\'t be empty strings')
      : WordpairCard(pair: WordPair(firstWord, secondWord));
}
