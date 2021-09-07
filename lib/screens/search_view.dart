import 'package:flutter/material.dart';
import 'package:movies/modal_class/genres.dart';
import 'package:movies/modal_class/movie.dart';
import 'package:movies/screens/widgets.dart';

class MovieSearch extends SearchDelegate<Movie?> {
  final ThemeData? themeData;
  final List<Genres>? genres;
  MovieSearch({this.themeData, this.genres});

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = themeData!.copyWith(
        hintColor: themeData!.accentColor,
        primaryColor: themeData!.primaryColor,
        textTheme: TextTheme(
          headline6: themeData!.textTheme.bodyText1,
        ));

    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: themeData!.accentColor,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: themeData!.accentColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchMovieWidget(
      genres: genres,
      themeData: themeData,
      query: query,
      onTap: (movie) {
        close(context, movie);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: themeData!.primaryColor,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 50,
            height: 50,
            child: Icon(
              Icons.search,
              size: 50,
              color: themeData!.accentColor,
            ),
          ),
          Text('Enter a Movie to search.',
              style: themeData!.textTheme.bodyText1)
        ],
      )),
    );
  }
}
