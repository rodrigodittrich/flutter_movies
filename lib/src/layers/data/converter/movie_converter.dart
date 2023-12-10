import '../../../core/core.dart';
import '../dto/movie_dto.dart';
import '../../domain/entities/movie.dart';

class MovieConverter implements Converter<Movie, MovieDto> {
  
  @override
  MovieDto createDto(Movie entity) {
    throw UnimplementedError();
  }

  @override
  Movie createEntity(MovieDto dto) {
    return Movie(
      id: dto.id,
      year: dto.year,
      title: dto.title,
      studios: dto.studios,
      producers: dto.producers,
      winner: dto.winner
    );
  }
}