import '../../../commons/commons.dart';
import '../../domain/entities/movie_page.dart';

class MoviePageConverter implements PageConverter<MoviePage, Page> {
  
  @override
  Page createDto(MoviePage entity) => Page();

  @override
  MoviePage createEntity(Page dto) {
    final MoviePage moviePage = MoviePage();
    moviePage.pageable = dto.pageable;
    moviePage.totalElements = dto.totalElements;
    moviePage.totalPages = dto.totalPages;
    moviePage.last = dto.last;
    moviePage.size = dto.size;
    moviePage.number = dto.number;
    moviePage.numberOfElements = dto.numberOfElements;
    moviePage.first = dto.first;
    moviePage.empty = dto.last;
    return moviePage;
  }
  
}