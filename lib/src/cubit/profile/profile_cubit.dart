import 'dart:convert';

import 'package:api_cubit/src/helper/storage_helper.dart';
import 'package:api_cubit/src/helper/storage_keys.dart';
import 'package:api_cubit/src/models/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  getProfileInfo()async {
    emit(ProfileLoading());
    try {


    String? profileInfoJSON = await StorageHelper.readData(
        StorageKeys.userData.name);
    if (profileInfoJSON == null) {
      emit(ProfileLoadError());
      return;
    }
    var profileInfoRaw = jsonDecode(profileInfoJSON);
    UserResponse userResponse= UserResponse.fromJson(profileInfoRaw);
    emit(ProfileLoadSuccess(userResponse));
  } catch(ex){
    emit(ProfileLoadError());
  }
  }
}
