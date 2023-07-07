# wordpair_generator

A Flutter project that generates a random wordpair and allows it to be added to a favorites list.

## Getting Started

This project is a starting point for a Flutter application based on [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab).

Furthermore, [bloc](https://github.com/felangel/bloc/) and [flutter_bloc](https://pub.dev/packages/flutter_bloc) have been used for state management.

Run `flutter run` to start the application.

## Project structure

├── lib
| ├── app
│ │ ├── app.dart
│ │ ├── wordpair_generator_observer.dart
| ├── favorites
│ │ ├── bloc
│ │ │ └── favorites_bloc.dart
| | | └── favorites_event.dart
| | | └── favorites_state.dart
│ │ └── view
│ │ | ├── favorites_page.dart
│ │ ├── favorites.dart*
| ├── generator
│ │ ├── bloc
│ │ │ └── generator_bloc.dart
| | | └── generator_event.dart
| | | └── generator_state.dart
│ │ └── view
│ │ | ├── generator_page.dart
│ │ └── widgets
│ │ | ├── history_list.dart
│ │ | ├── wordpair_card.dart
│ │ | ├── widgets.dart*
│ │ ├── generator.dart*
| ├── home
│ │ ├── cubit
│ │ │ └── home_cubit.dart
│ │ └── view
│ │ | ├── home_page.dart
│ │ ├── home.dart*
| ├── repository
│ │ ├── favorites
│ │ │ └── favorites_repository.dart
│ │ │ └── local_storage_favorites.dart
│ │ ├── repository.dart\*
│ └── main.dart
├── pubspec.yaml

The application uses a page-driven directory structure. This project structure enables us to scale the project by having self-contained pages. In this example we will have "three" pages and they're split up into folders with barrel files, indicated by the asterisk (\*).

### Home page

Takes care of deciding where to navigate. By default, the generator page will be loaded, but the home page has a navigation sidebar to navigate between the favorites and the generator page.
To control the located page, a cubit has been used to store the selected index value.

### Generator page

This page takes care of generating a new WordPair every time the `Generate` button is clicked. Everytime it's clicked, the list below the actions is updated with the last generated wordpair.
Furthermore, the current word can be added to the favorites list. That action can also be performed in a previous word shown in the history list by simply clicking on it.

### Favorites page

This page shows the list of favorite words so far.
To have access to this list from diferent pages (and blocs), the favorites list is stored in a local storage.
To be able to use this local storage, a repository has been implemented and it can be passed down in the constructor of the blocs that need it.
