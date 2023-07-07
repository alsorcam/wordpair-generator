import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wordpair_generator/generator/generator.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneratorBloc, GeneratorState>(
      builder: (context, state) {
        final WordPair currentWordpair = state.currentWordpair;
        final List<WordPair> favorites = state.favorites;
        final List<WordPair> history = state.history;
        toggleFavorite(WordPair pair) =>
            context.read<GeneratorBloc>().add(ToggleLike(pair));
        generateWordpair() =>
            context.read<GeneratorBloc>().add(GenerateWordpair());

        IconData icon = Icons.favorite_border;
        if (favorites.contains(currentWordpair)) {
          icon = Icons.favorite;
        } else {
          icon = Icons.favorite_border;
        }

        return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 50),
          WordpairCard(pair: currentWordpair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  toggleFavorite(state.currentWordpair);
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  generateWordpair();
                },
                child: Text('Generate'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
              flex: 2,
              child: HistoryListView(
                  favorites: favorites,
                  history: history,
                  toggleFavorite: (WordPair pair) {
                    toggleFavorite(pair);
                  })),
        ]));
      },
    );
  }
}
