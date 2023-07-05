import 'dart:convert';
import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class LocalStorageFavorites {
  LocalStorageFavorites({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;
  final _favoritesStreamController =
      BehaviorSubject<List<WordPair>>.seeded(const []);

  /// The key used for storing the todos locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kFavoritesCollectionKey = '__favorites_collection_key__';

  // String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    // final favoritesJson = _getValue(kFavoritesCollectionKey);
    // if (favoritesJson != null) {
    //   log("FAVORITES: ${json.decode(favoritesJson)}");
    // final favorites = List<Map<dynamic, dynamic>>.from(
    //   json.decode(favoritesJson) as List,
    // )
    //     .map((jsonMap) => Todo.fromJson(Map<String, dynamic>.from(jsonMap)))
    //     .toList();
    // _favoritesStreamController.add(favorites);
    // } else {}
    _favoritesStreamController.add(const []);
  }

  Stream<List<WordPair>> getFavorites() =>
      _favoritesStreamController.asBroadcastStream();

  Future<void> addFavorite(WordPair wordpair) {
    final favorites = [..._favoritesStreamController.value, wordpair];
    _favoritesStreamController.add(favorites);
    return _setValue(kFavoritesCollectionKey, json.encode(favorites));
  }

  Future<void> removeFavorite(WordPair wordpair) {
    final favorites = [..._favoritesStreamController.value..remove(wordpair)];
    _favoritesStreamController.add(favorites);
    return _setValue(kFavoritesCollectionKey, json.encode(favorites));
  }

  Future<void> toggleFavorite(WordPair wordpair) {
    bool isInFavorites = _favoritesStreamController.value.contains(wordpair);
    if (isInFavorites) {
      return removeFavorite(wordpair);
    } else {
      return addFavorite(wordpair);
    }
  }
}
