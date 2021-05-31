import 'package:flutter/material.dart';
import 'package:onboarding/models/get_movie_built_value.dart';
import 'package:onboarding/models/movie_genres.dart';
import 'package:onboarding/screens/movie_details_screen.dart';
import 'package:onboarding/widgets/constants.dart';
import 'package:onboarding/widgets/custom_divider.dart';
import 'package:onboarding/widgets/newColors.dart';

class BuildCardsList extends StatelessWidget {
  const BuildCardsList({
    Key key,
    @required ScrollController controller,
    @required this.customMainTextStyle,
    @required this.listMovies,
  })  : _controller = controller,
        super(key: key);

  final ScrollController _controller;
  final TextStyle customMainTextStyle;
  final List<MovieData> listMovies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: listMovies.length,
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: listPaddingVerticalSize,
                horizontal:
                    MediaQuery.of(context).size.width * movieBoxHorizontal),
            child: Card(
              child: Column(
                children: [
                  Text(
                    'Movie ${listMovies[index].title}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height *
                            movieNameTextSize),
                  ),
                  CustomDivider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                              moviesDetails: listMovies[index]),
                        ),
                      );
                    },
                    child: Image.network(
                        '$baseImageUrl${listMovies[index].posterPath}',
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace stackTrace) {
                      return Text('Could not load movie poster',
                          style: customMainTextStyle);
                    }),
                  ),
                  CustomDivider(),
                  Text(
                    'Genres: ${getGenresList(ids: listMovies[index].genreIds)}',
                    style: customMainTextStyle,
                  ),
                  CustomDivider(),
                  Text(
                    'Release date: ${listMovies[index].releaseDate}',
                    style: customMainTextStyle,
                  ),
                ],
              ),
              color: PaySmartColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
