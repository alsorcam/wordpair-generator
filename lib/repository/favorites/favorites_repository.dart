import 'package:english_words/english_words.dart';

import 'package:wordpair_generator/repository/favorites/local_storage_favorites.dart';

class FavoritesRepository {
  const FavoritesRepository({
    required LocalStorageFavorites favoritesStorage,
  }) : _favoritesStorage = favoritesStorage;

  final LocalStorageFavorites _favoritesStorage;

  Stream<List<WordPair>> getFavorites() => _favoritesStorage.getFavorites();

  Future<void> toggleFavorite(WordPair wordpair) =>
      _favoritesStorage.toggleFavorite(wordpair);
}
