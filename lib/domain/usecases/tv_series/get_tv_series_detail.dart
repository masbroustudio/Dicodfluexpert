import 'package:dartz/dartz.dart';
import 'package:umovieapp/common/failure.dart';
import 'package:umovieapp/domain/entities/tv_series_detail.dart';
import 'package:umovieapp/domain/repositories/tv_series_repository.dart';

class GetTvSeriesDetail {
  final TvSeriesRepository repository;

  GetTvSeriesDetail(this.repository);

  Future<Either<Failure, TvSeriesDetail>> execute(int id) {
    return repository.getTvSeriesDetail(id);
  }
}
