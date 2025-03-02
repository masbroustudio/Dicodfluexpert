import 'package:umovieapp/data/datasources/db/database_helper.dart';
import 'package:umovieapp/data/datasources/movie_local_data_source.dart';
import 'package:umovieapp/data/datasources/movie_remote_data_source.dart';
import 'package:umovieapp/data/datasources/tv_series_local_data_source.dart';
import 'package:umovieapp/data/datasources/tv_series_remote_data_source.dart';
import 'package:umovieapp/domain/repositories/movie_repository.dart';
import 'package:umovieapp/domain/repositories/tv_series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
