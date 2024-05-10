import 'package:dartz/dartz.dart';
import 'package:umovieapp/domain/entities/movie.dart';
import 'package:umovieapp/domain/repositories/movie_repository.dart';
import 'package:umovieapp/common/failure.dart';

class GetWatchlistMovies {
  final MovieRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
