part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}
class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}
class ProfileLoadSuccess extends ProfileState {
  final UserResponse userResponse;

 const ProfileLoadSuccess(this.userResponse);

  @override
  List<Object> get props => [userResponse];
}
class ProfileLoadError extends ProfileState {
  @override
  List<Object> get props => [];
}