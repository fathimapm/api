import 'package:api_cubit/src/helper/api_helper.dart';
import 'package:api_cubit/src/web_service/api_routes.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:api_cubit/src/models/subscription_model.dart';

class SubscriptionRepository{
Future<ApiResponseModel>getAllSubscription () async{


  ApiResponseModel response = await ApiHelper().makeGetRequest(ApiRoutes.subscriptionRoute);
  return response;
}
Future<ApiResponseModel> createSubscription(SubscriptionModel subscriptionModel) async{


  ApiResponseModel response = await ApiHelper().makePostRequest (ApiRoutes.subscriptionRoute,subscriptionModel.toJson());
  return response;
}


Future<ApiResponseModel> deleteSubscriptionPlan(SubscriptionModel subscriptionModel) async{


  ApiResponseModel response = await ApiHelper().makeDeleteRequest (ApiRoutes.subscriptionRoute+"/${subscriptionModel.id}");
  return response;
}
Future<ApiResponseModel> updateSubscription(SubscriptionModel subscriptionModel) async{


  ApiResponseModel response = await ApiHelper().makePatchRequest (ApiRoutes.subscriptionRoute+"/${subscriptionModel.id}",subscriptionModel.toJson());
  return response;
}
Future<ApiResponseModel>getSubscriptionById (SubscriptionModel subscriptionModel) async{


  ApiResponseModel response = await ApiHelper().makeGetRequest (ApiRoutes.subscriptionRoute+"/${subscriptionModel.id}");
  return response;
}
}