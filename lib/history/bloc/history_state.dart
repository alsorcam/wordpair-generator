part of 'history_bloc.dart';

final class HistoryState extends Equatable {
  const HistoryState({this.history = const [], this.favorites = const []});

  final List<WordPair> history;
  final List<WordPair> favorites;

  HistoryState copyWith({
    List<WordPair>? history,
    List<WordPair>? favorites,
  }) {
    return HistoryState(
      history: history ?? this.history,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object> get props => [
        history,
        favorites,
      ];
}
