import 'package:english_words/english_words.dart';

import 'package:wordpair_generator/repository/history/local_storage_history.dart';

class HistoryRepository {
  const HistoryRepository({
    required LocalStorageHistory historyStorage,
  }) : _historyStorage = historyStorage;

  final LocalStorageHistory _historyStorage;

  Stream<List<WordPair>> getHistory() => _historyStorage.getHistory();

  Future<void> addToHistory(WordPair wordpair) =>
      _historyStorage.addToHistory(wordpair);
}
