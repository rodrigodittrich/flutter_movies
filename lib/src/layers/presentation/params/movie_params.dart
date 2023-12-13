import '../../../commons/commons.dart';

class MovieParams extends Params {
  int? year;
  bool? winner;

  MovieParams({
    super.page,
    super.size,
    this.year,
    this.winner
  });

  @override
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'page': page});
    result.addAll({'size': size});
    if(year != null){
      result.addAll({'year': year});
    }
    if(winner != null){
      result.addAll({'winner': winner});
    }
    return result;
  }
}