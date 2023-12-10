import '../../../commons/commons.dart';

class MovieException extends CustomException {
  MovieException({required super.title, required super.message});
}