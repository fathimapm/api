

import 'dart:convert';

import 'package:api_cubit/src/helper/api_helper.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:api_cubit/src/models/user_model.dart';
import 'package:api_cubit/src/web_service/api_routes.dart';
import 'package:api_cubit/src/helper/storage_helper.dart';
import 'package:api_cubit/src/helper/storage_keys.dart';
class AuthenticationRepository{
   Future<ApiResponseModel>login (String email,String password) async{
    Map<String,dynamic> data = {
      "email": email,
      "password":password
    };
     ApiResponseModel response = await ApiHelper().makePostRequest (ApiRoutes.loginRoute,data);
     return response;
  }
   Future<ApiResponseModel>changePassword (String currentPassword ,String newPassword) async{
     Map<String,dynamic> data = {
       "currentPassword": currentPassword,
       "newPassword":newPassword,
     };
     ApiResponseModel response = await ApiHelper().makePostRequest (ApiRoutes.changePasswordRoute,data);
     return response;
   }
   Future<ApiResponseModel>updateUser(Map<String  ,dynamic >data) async{
     Map<String,String> data = {

     };
     ApiResponseModel response = await ApiHelper().makePatchRequest (ApiRoutes.updateUserRoute,data);
     return response;
   }
  Future<bool> checkAutoLogin()async {
    try {
      String? userDataJSON = await StorageHelper.readData(
          StorageKeys.userData.name);
      String? jwtString = await StorageHelper.readData(StorageKeys.jwt.name);
      String? loginTimeString = await StorageHelper.readData(StorageKeys.loginTime.name);
      if (userDataJSON == null || jwtString == null || loginTimeString ==null) {
        return false;
      }
      UserResponse userResponse = UserResponse.fromJson(
          jsonDecode(userDataJSON));
      if (userResponse == null) {
        return false;
      }
      DateTime loginTime =DateTime.parse(loginTimeString);
      if (DateTime.now().difference(loginTime).inDays>=2){
        return false;
      }
      return true;
    } catch (ex) {
      return false;
    }
  }
}