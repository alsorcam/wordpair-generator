part of 'favorites_bloc.dart';

final class FavoritesState extends Equatable {
  const FavoritesState({this.favorites = const []});

  final List<WordPair> favorites;

  @override
  List<Object> get props => [favorites];
}
