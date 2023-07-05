import 'dart:convert';

import 'package:english_words/english_words.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class LocalStorageHistory {
  LocalStorageHistory({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;
  final _historyStreamController =
      BehaviorSubject<List<WordPair>>.seeded(const []);

  /// The key used for storing the todos locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kHistoryCollectionKey = '__history_collection_key__';

  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    _historyStreamController.add(const []);
  }

  Stream<List<WordPair>> getHistory() =>
      _historyStreamController.asBroadcastStream();

  Future<void> addToHistory(WordPair wordpair) {
    final history = [wordpair, ..._historyStreamController.value];
    _historyStreamController.add(history);
    return _setValue(kHistoryCollectionKey, json.encode(history));
  }
}
