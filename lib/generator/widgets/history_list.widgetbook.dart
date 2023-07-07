import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'package:wordpair_generator/generator/widgets/widgets.dart';

@UseCase(
  name: 'History list',
  type: AnimatedList,
)
historyListViewUseCase(BuildContext context) {
  return HistoryListView(favorites: [
    WordPair('Second', 'word')
  ], history: [
    WordPair('First', 'word'),
    WordPair('Second', 'word'),
    WordPair('Third', 'word')
  ], wordClick: (WordPair pair) => print("Click on ${pair.asLowerCase}"));
}
