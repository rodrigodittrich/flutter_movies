import 'package:dio/dio.dart';
import '../../errors/custom_exception.dart';
import '../service/http_service.dart';

class DioServiceImpl implements HttpService {
  final Dio client;

  DioServiceImpl(this.client);

  @override
  Future<dynamic> get({required String endPoint}) async {
    try {
      final response = (await client.get(client.options.baseUrl + endPoint)).data;
      return response;
    } on DioException {
      //Considerando um sistema real, aqui precisa implementar pelo menos todos os erros previstos. Exemplo erro 401.
      throw CustomException(
        title: 'Ocorreu um erro',
        message: 'Ocorreu um erro ao processar a solicitação');
    }
  }
}