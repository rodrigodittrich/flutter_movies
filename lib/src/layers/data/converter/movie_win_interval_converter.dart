import '../../../commons/commons.dart';
import '../../domain/entities/movie_win_interval.dart';
import '../../domain/entities/movie_win_min_max_interval.dart';
import '../dto/movie_win_interval_dto.dart';
import 'movie_win_min_max_interval_converter.dart';

class MovieWinIntervalConverter implements Converter<MovieWinInterval, MovieWinIntervalDto> {
  final Converter converter = MovieWinMinMaxIntervalConverter();
  
  @override
  MovieWinIntervalDto createDto(MovieWinInterval entity) => MovieWinIntervalDto();

  @override
  MovieWinInterval createEntity(MovieWinIntervalDto dto) => MovieWinInterval(
    min: List<MovieWinMinMaxInterval>.from(dto.min.map((min) => converter.createEntity(min))),
    max: List<MovieWinMinMaxInterval>.from(dto.max.map((max) => converter.createEntity(max))),
  );
}