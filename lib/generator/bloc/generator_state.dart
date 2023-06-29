part of 'generator_bloc.dart';

final class GeneratorState extends Equatable {
  const GeneratorState(
      {required this.currentWordpair,
      this.history = const [],
      this.favorites = const []});

  final WordPair currentWordpair;
  final List<WordPair> history;
  final List<WordPair> favorites;

  GeneratorState copyWith({
    WordPair? currentWordpair,
    List<WordPair>? history,
    List<WordPair>? favorites,
  }) {
    return GeneratorState(
      currentWordpair: currentWordpair ?? this.currentWordpair,
      history: history ?? this.history,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object?> get props => [
        currentWordpair,
        history,
        favorites,
      ];
}
