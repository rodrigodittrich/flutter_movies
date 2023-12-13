import '../../../commons/commons.dart';

class MovieParams extends Params {
  int? year;

  MovieParams({
    super.page,
    super.size,
    this.year,
  });

  @override
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'page': page});
    result.addAll({'size': size});
    if(year != null){
      result.addAll({'year': year});
    }
    return result;
  }
}