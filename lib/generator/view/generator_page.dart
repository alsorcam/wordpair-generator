import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wordpair_generator/generator/bloc/generator_bloc.dart';
import 'package:wordpair_generator/generator/widgets/widgets.dart';
import 'package:wordpair_generator/history/history.dart';
import 'package:wordpair_generator/repository/repository.dart';

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneratorBloc(
          historyRepository: context.read<HistoryRepository>(),
          favoritesRepository: context.read<FavoritesRepository>())
        ..add(LoadFavorites()),
      child: const GeneratorView(),
    );
  }
}

class GeneratorView extends StatelessWidget {
  const GeneratorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneratorBloc, GeneratorState>(
      builder: (context, state) {
        // FIXME: Toggle icon when deselecting favorite
        IconData icon = Icons.favorite_border;
        if (state.favorites.contains(state.currentWordpair)) {
          icon = Icons.favorite;
        } else {
          icon = Icons.favorite_border;
        }

        return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 50),
          WordpairCard(pair: state.currentWordpair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  context
                      .read<GeneratorBloc>()
                      .add(ToggleLike(state.currentWordpair));
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  context.read<GeneratorBloc>().add(GenerateWordpair());
                },
                child: Text('Generate'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 2,
            child: HistoryListView(),
          ),
        ]));
      },
    );
  }
}
