import 'dart:async';
import '../../errors/custom_exception.dart';
import 'base_repository.dart';
import '../service/http_service.dart';

class BaseRepositoryImpl implements BaseRepository {
  final HttpService httpService;

  BaseRepositoryImpl(this.httpService);

  @override
  Future get({required String endPoint}) async {
    try {
      return await httpService.get(endPoint: endPoint).timeout(const Duration(seconds: 10));
    } on TimeoutException {
      throw CustomException(
          title: 'Operação não realizada',
          message: 'Tempo de limite excedido!');
    }
  }
}