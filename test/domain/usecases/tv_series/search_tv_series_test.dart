import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:umovieapp/domain/entities/tv_series.dart';
import 'package:umovieapp/domain/usecases/tv_series/search_tv_series.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SearchTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = SearchTvSeries(mockTvSeriesRepository);
  });

  final tTvSeries = <TvSeries>[];
  final tQuery = 'Greek';

  test('should get list of tv series from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.searchTvSeries(tQuery))
        .thenAnswer((_) async => Right(tTvSeries));
    // act
    final result = await usecase.execute(tQuery);
    // assert
    expect(result, Right(tTvSeries));
  });
}
