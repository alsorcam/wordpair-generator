import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wordpair_generator/main.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<WordpairGeneratorAppState>();
    var favorites = appState.favorites;

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
  }
}
