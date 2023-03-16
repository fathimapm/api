import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:api_cubit/src/helper/storage_helper.dart';
import 'package:api_cubit/src/helper/storage_keys.dart';
import 'package:api_cubit/src/models/api_response_model.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();
  factory ApiHelper() => _instance;
  ApiHelper._internal();

  static final Dio dio = Dio();
  static initialize() {
    dio.options.baseUrl = 'http://15.206.27.26/';
    dio.options.connectTimeout = 60000; //5s
    dio.options.receiveTimeout = 60000;
  }

// Api request for getting data //
  //get request//
  Future<ApiResponseModel> makeGetRequest(String route,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
    await dio.get(route, options: Options(headers: mHeaders));
    return ApiResponseModel.fromJSON(response.data);
  }

  //Api request for post request or updating data//
  //post request//

  Future<ApiResponseModel> makePostRequest(String route, dynamic body,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.post(route,
        data: jsonEncode(body), options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
    ApiResponseModel.fromJSON(response.data);
    return apiResponseModel;
  }

//Api request for edit or update data//
  //put request//
  Future<ApiResponseModel> makePutRequest(String route, dynamic body,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.put(route,
        data: jsonEncode(body), options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
    ApiResponseModel.fromJSON(response.data);
    return apiResponseModel;
  }

//Api request for edit or updata data//
  //patch request//
  Future<ApiResponseModel> makePatchRequest(String route, dynamic body,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response = await dio.patch(route,
        data: jsonEncode(body), options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
    ApiResponseModel.fromJSON(response.data);
    return apiResponseModel;
  }
  //Api request for deleting the data//
  //delete request//

  Future<ApiResponseModel> makeDeleteRequest(String route,
      {Map<String, String>? headers}) async {
    Map<String, String> mHeaders = {};
    Map<String, String> defaultHeaders = await getDefaultHeaders();
    mHeaders.addAll(defaultHeaders);
    if (headers != null) {
      mHeaders.addAll(headers);
    }
    Response response =
    await dio.delete(route, options: Options(headers: mHeaders));
    ApiResponseModel apiResponseModel =
    ApiResponseModel.fromJSON(response.data);
    return apiResponseModel;
  }

// header function//
  //to add the header data//
  Future<Map<String, String>> getDefaultHeaders() async {
    String? token = await StorageHelper.readData(StorageKeys.jwt.name);
    Map<String, String> headers = {
      "Content-Type": "application/json"
    }; //depends on the content type like , json,formdata,multipart ect..//
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    return headers;
  }
}