import 'movie_win_min_max_interval_dto.dart';

class MovieWinIntervalDto {
  List<MovieWinMinMaxIntervalDto> min;
  List<MovieWinMinMaxIntervalDto> max;

  MovieWinIntervalDto({
    this.min = const [],
    this.max = const [],
  });

  factory MovieWinIntervalDto.fromMap(Map<String, dynamic> map) {
    return MovieWinIntervalDto(
      min: List<MovieWinMinMaxIntervalDto>.from(map['min']?.map((x) => MovieWinMinMaxIntervalDto.fromMap(x)) ?? const []),
      max: List<MovieWinMinMaxIntervalDto>.from(map['max']?.map((x) => MovieWinMinMaxIntervalDto.fromMap(x)) ?? const []),
    );
  }
}