import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpair_generator/favorites/bloc/favorites_bloc.dart';

import 'package:wordpair_generator/repository/repository.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesBloc(
          favoritesRepository: context.read<FavoritesRepository>())
        ..add(FavoritesLoaded()),
      child: const FavoritesView(),
    );
  }
}

class FavoritesView extends StatelessWidget {
  const FavoritesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
      var favorites = state.favorites;

      final theme = Theme.of(context);
      final headlineStyle = theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

      final headline = Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Favorite words',
          style: headlineStyle,
        ),
      );

      if (favorites.isEmpty) {
        return Center(
          child: Column(
            children: [
              headline,
              Text('No favorites yet.'),
            ],
          ),
        );
      }

      return ListView(
        children: [
          Center(child: headline),
          for (var pair in favorites)
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(pair.asLowerCase),
            ),
        ],
      );
    });
  }
}
