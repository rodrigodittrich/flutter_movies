import '../../../core/core.dart';
import '../../domain/entities/movie_studio_winning.dart';
import '../dto/movie_studio_winning_dto.dart';

class MovieStudioWinningConverter implements Converter<MovieStudioWinning, MovieStudioWinningDto> {
  
  @override
  MovieStudioWinningDto createDto(MovieStudioWinning entity) => MovieStudioWinningDto();

  @override
  MovieStudioWinning createEntity(MovieStudioWinningDto dto) => MovieStudioWinning(
    name: dto.name,
    winCount: dto.winCount,
  );
}