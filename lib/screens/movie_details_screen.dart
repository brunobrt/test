import 'package:flutter/material.dart';
import 'package:onboarding/models/get_movie_built_value.dart';
import 'package:onboarding/models/movie_genres.dart';
import 'package:onboarding/widgets/constants.dart';
import 'package:onboarding/widgets/custom_divider.dart';
import 'package:onboarding/widgets/newColors.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieData moviesDetails;

  MovieDetailsScreen({Key key, @required this.moviesDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customDetailsTextStyle = TextStyle(
        color: PaySmartColors.lightGreen,
        fontSize: MediaQuery.of(context).size.height * movieTitleTextSize);
    final customDetailsEdgeInsets = EdgeInsets.symmetric(
        vertical: listPaddingVerticalSize,
        horizontal:
            MediaQuery.of(context).size.width * listTextDividerHorizontalSize);
    return Scaffold(
      appBar: AppBar(
        title: Text(movieDetailsTitle),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  movieDetailsCard(
                    context,
                    customDetailsEdgeInsets,
                    Text(
                      'Movie title: ${this.moviesDetails.title}',
                      style: customDetailsTextStyle,
                    ),
                  ),
                  CustomDivider(),
                  Card(
                    child: Padding(
                      padding: customDetailsEdgeInsets,
                      child: Image.network(
                          '$baseImageUrl${this.moviesDetails.posterPath}'),
                    ),
                    color: PaySmartColors.darkBlue,
                  ),
                  CustomDivider(),
                  movieDetailsCard(
                    context,
                    customDetailsEdgeInsets,
                    Text(
                      'Genres: ${getGenresList(ids: this.moviesDetails.genreIds)}',
                      style: customDetailsTextStyle,
                    ),
                  ),
                  CustomDivider(),
                  movieDetailsCard(
                    context,
                    customDetailsEdgeInsets,
                    Text(
                      'Movie ${this.moviesDetails.overview}',
                      style: customDetailsTextStyle,
                    ),
                  ),
                  CustomDivider(),
                  movieDetailsCard(
                    context,
                    customDetailsEdgeInsets,
                    Text(
                      'Release date: ${this.moviesDetails.releaseDate}',
                      style: customDetailsTextStyle,
                    ),
                  ),
                  CustomDivider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card movieDetailsCard(
      BuildContext context, EdgeInsets edgeInsets, Text text) {
    return Card(
      child: Padding(padding: edgeInsets, child: text),
      color: PaySmartColors.darkBlue,
    );
  }
}
