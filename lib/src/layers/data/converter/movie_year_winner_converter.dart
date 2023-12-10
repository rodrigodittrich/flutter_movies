import '../../../core/core.dart';
import '../../domain/entities/movie_year_winner.dart';
import '../dto/movie_year_winner_dto.dart';

class MovieYearWinnerConverter implements Converter<MovieYearWinner, MovieYearWinnerDto> {
  
  @override
  MovieYearWinnerDto createDto(MovieYearWinner entity) => MovieYearWinnerDto();

  @override
  MovieYearWinner createEntity(MovieYearWinnerDto dto) => MovieYearWinner(
    year: dto.year,
    winnerCount: dto.winnerCount,
  );
}