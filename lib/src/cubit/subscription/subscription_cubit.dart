import 'package:api_cubit/src/cubit/subscription/subscription_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_cubit/src/models/api_response_model.dart';
import 'package:api_cubit/src/models/subscription_model.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {

  SubscriptionCubit() : super(SubscriptionInitial());
  final SubscriptionRepository _repository =SubscriptionRepository();
  getAllSubscription()async{
    emit(SubscriptionLoading());
    try{
      ApiResponseModel response = await _repository.getAllSubscription();
      if(response.status){
        List<dynamic> subscriptionJsonList =response.data;
        List<SubscriptionModel>subscribers = subscriptionJsonList.map<SubscriptionModel>((subscriptionItemJSON) => SubscriptionModel.fromJSON(subscriptionItemJSON)).toList();
        emit(SubscriptionLoadSuccess(subscribers));
      }else{
        String errorMessage =response.error!;
        emit(SubscriptionLoadError(errorMessage));
      }
    }catch(ex){
      emit( const SubscriptionLoadError("Something went wrong"));
    }

  }
  addSubscription(SubscriptionModel subscriptionModel) async{
    emit(SubscriptionLoading());
    try{
      ApiResponseModel response = await _repository.createSubscription(subscriptionModel);
      if(response.status){
        emit(SubscriptionCreationSuccess(subscriptionModel));
      }else{
        emit(SubscriptionCreationError(response.error!));
      }
    }catch(ex){
      emit( const SubscriptionCreationError("Something went wrong"));
    }
    await Future.delayed( const Duration(seconds:2));
    getAllSubscription();
  }


  getCategoryById(SubscriptionModel subscriptionModel) async{
    emit(SubscriptionLoading());
    try{
      ApiResponseModel response = await _repository.getSubscriptionById(subscriptionModel);
      if(response.status){
        SubscriptionModel subscriptionModel=SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionByIdSuccess(subscriptionModel));
      }else{
        emit(SubscriptionByIdError(response.error!));
      }
    }catch(ex){
      emit( const SubscriptionByIdError("Something went wrong"));
    }

  }


  deleteCategory(SubscriptionModel subscriptionModel) async{
    emit(SubscriptionLoading());
    try{
      ApiResponseModel response = await _repository.deleteSubscriptionPlan(subscriptionModel);
      if(response.status){
        emit(SubscriptionDeleteSuccess());
      }else{
        emit(SubscriptionDeleteError(response.error!));
      }
    }catch(ex){
      emit( const SubscriptionDeleteError("Something went wrong"));
    }
    await Future.delayed( const Duration(seconds:2));
    getAllSubscription();
  }
  updateCategory(SubscriptionModel subscriptionModel) async {
    emit(SubscriptionLoading());
    try{
      ApiResponseModel response = await _repository.updateSubscription(subscriptionModel);
      if(response.status){
       SubscriptionModel subscriptionModel=SubscriptionModel.fromJSON(response.data);
        emit(SubscriptionUpdateSuccess(subscriptionModel));
      }else{
        emit(SubscriptionUpdateError(response.error!));
      }
    }catch(ex){
      emit( const SubscriptionUpdateError("Something went wrong"));
    }
    await Future.delayed( const Duration(seconds:2));
   getAllSubscription();
  }


}
