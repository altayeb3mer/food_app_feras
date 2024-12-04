import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/network/network_constants.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/data/models/request/auth/dto_request_login.dart';
import 'package:food_app/data/models/response/user/dto_response_user.dart';

abstract class ServiceLogin {
  Future<DtoResponseUser?> login(DtoRequestLogin request);
}

class ServiceLoginImpl extends ServiceLogin {
  final DioClient dioClient;

  ServiceLoginImpl({required this.dioClient});

  @override
  Future<DtoResponseUser?> login(DtoRequestLogin request) async {
    try {
      final Response response = await dioClient.dio
          .post(NetworkConstants.login, data: request.toJson());
      final res=DtoResponseUser.fromJson(response.data['data']);
      return res;
    }  on DioException catch (e) {
      if(e.response?.statusCode==422){
        String? msg = e.response?.data["message"];
        AppMassager.showError(msg??'Error');
      }
    }
  }
}
