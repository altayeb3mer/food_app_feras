import 'package:dio/dio.dart';
import 'package:food_app/core/network/dio_client.dart';
import 'package:food_app/core/network/network_constants.dart';
import 'package:food_app/core/utilities/app_massager.dart';
import 'package:food_app/data/models/request/auth/dto_request_register.dart';
import 'package:food_app/data/models/response/user/dto_response_user.dart';

abstract class ServiceRegister {
  Future<DtoResponseUser?> register(DtoRequestRegister request);
}

class ServiceRegisterImpl extends ServiceRegister {
  final DioClient dioClient;

  ServiceRegisterImpl({required this.dioClient});

  @override
  Future<DtoResponseUser?> register(DtoRequestRegister request) async {
    try {
      final Response response = await dioClient.dio
          .post(NetworkConstants.register, data: request.toJson());

      final res=DtoResponseUser.fromJson(response.data['data']);
      return res;
    } on DioException catch (e) {
      if(e.response?.statusCode==422){
        String? msg = e.response?.data["message"];
        AppMassager.showError(msg??'Error');
      }
    }
  }
}