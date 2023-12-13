import '../../../commons_dependencies/commons_dependencies.dart';
import '../../domain/entities/movie_studio_winning.dart';
import '../../domain/usecases/list_of_wins_by_studio/list_of_wins_by_studio_use_case.dart';

class MovieTopStudiosWinnersController extends Store<List<MovieStudioWinning>> {
  final ListOfWinsByStudioUseCase _listOfWinsByStudioUseCase;

  MovieTopStudiosWinnersController(this._listOfWinsByStudioUseCase) : super([]);

  Future<void> listOfWinsByStudio() async {
    setLoading(true);
    final result = await _listOfWinsByStudioUseCase(); 
    result.fold(
      (success) => topStudiosWithWinners(success),
      (failure) => setError(failure)
    );
    setLoading(false);
  }

  void topStudiosWithWinners(List<MovieStudioWinning> studioWinnings, {int topStudios = 3}) {
    studioWinnings.sort((a, b) => b.winCount!.compareTo(a.winCount!));
    final topXstudioWinnings = studioWinnings.sublist(0, topStudios);
    update(topXstudioWinnings);
  }
}