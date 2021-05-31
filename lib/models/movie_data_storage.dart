import 'dart:convert';
import 'dart:io';
import 'package:onboarding/models/get_movie_built_value.dart';
import 'package:onboarding/models/serializers.dart';
import 'package:path_provider/path_provider.dart';

class MovieDataStorage {
  static Future<String> get _localPath async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/movieDataFile.txt');
  }

  static void writeData(List<MovieData> listMovies) async {
    final file = await _localFile;
    final movieMapList = listMovies
        .map((item) => serializers.serializeWith(MovieData.serializer, item))
        .toList();
    await file.writeAsString(jsonEncode(movieMapList));
  }

  static Future<List<MovieData>> readData() async {
    try {
      final file = await _localFile;
      final file2 = await file.readAsString();
      final json = jsonDecode(file2);
      return json
          .map(
              (item) => serializers.deserializeWith(MovieData.serializer, item))
          .toList()
          .cast<MovieData>();
    } catch (err) {
      print('readData error: $err');
      return [];
    }
  }
}
