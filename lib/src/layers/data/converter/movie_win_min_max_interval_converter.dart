import '../../../commons/commons.dart';
import '../../domain/entities/movie_win_min_max_interval.dart';
import '../dto/movie_win_min_max_interval_dto.dart';

class MovieWinMinMaxIntervalConverter implements Converter<MovieWinMinMaxInterval, MovieWinMinMaxIntervalDto> {
  
  @override
  MovieWinMinMaxIntervalDto createDto(MovieWinMinMaxInterval entity) => MovieWinMinMaxIntervalDto();

  @override
  MovieWinMinMaxInterval createEntity(MovieWinMinMaxIntervalDto dto) => MovieWinMinMaxInterval(
    producer: dto.producer,
    interval: dto.interval,
    previousWin: dto.previousWin,
    followingWin: dto.followingWin
  );
}