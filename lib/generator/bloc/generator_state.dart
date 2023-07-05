part of 'generator_bloc.dart';

final class GeneratorState extends Equatable {
  const GeneratorState(
      {required this.currentWordpair, this.favorites = const []});

  final WordPair currentWordpair;
  final List<WordPair> favorites;

  GeneratorState copyWith({
    WordPair? currentWordpair,
    List<WordPair>? favorites,
  }) {
    return GeneratorState(
      currentWordpair: currentWordpair ?? this.currentWordpair,
      favorites: favorites ?? this.favorites,
    );
  }

  @override
  List<Object?> get props => [
        currentWordpair,
        favorites,
      ];
}
