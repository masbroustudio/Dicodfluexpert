import 'dart:convert';

import 'package:umovieapp/data/models/movie_model.dart';
import 'package:umovieapp/data/models/movie_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../json_reader.dart';

void main() {
  final tMovieModel = MovieModel(
    id: 1,
    originalTitle: "Original Title",
    overview: "Overview",
    popularity: 1.0,
    posterPath: "/path.jpg",
    releaseDate: "2020-05-05",
    title: "Title",
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
    adult: false,
    backdropPath: "/path.jpg",
    genreIds: [1, 2, 3, 4],
  );
  final tMovieResponseModel =
      MovieResponse(movieList: <MovieModel>[tMovieModel]);
  group('Valid Model From Json', () {
    test('Return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/movies/now_playing.json'));
      // act
      final result = MovieResponse.fromJson(jsonMap);
      // assert
      expect(result, tMovieResponseModel);
    });
  });

  group('Valid Model To Json', () {
    test('Return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tMovieResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "adult": false,
            "backdrop_path": "/path.jpg",
            "genre_ids": [1, 2, 3, 4],
            "id": 1,
            "original_title": "Original Title",
            "overview": "Overview",
            "popularity": 1.0,
            "poster_path": "/path.jpg",
            "release_date": "2020-05-05",
            "title": "Title",
            "video": false,
            "vote_average": 1.0,
            "vote_count": 1
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
