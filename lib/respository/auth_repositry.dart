import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepositry{
  final BaseApiServices _apiServices=NetworkApiServices();
  Future<dynamic> loginApi(dynamic data )async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.loginEndPointUrl, data);
      return response;

    }catch(e){
      return e;
    }
  }
  Future<dynamic> signUpApi(dynamic data )async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.registerApiEndPointUrl, data);
      return response;

    }catch(e){
      return e;
    }
  }

}