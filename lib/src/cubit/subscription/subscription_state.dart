part of 'subscription_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();
}

class SubscriptionInitial extends SubscriptionState {
  @override
  List<Object> get props => [];
}
class SubscriptionLoading extends SubscriptionState {
  @override
  List<Object> get props => [];
}
class SubscriptionLoadSuccess extends SubscriptionState {
  final List<SubscriptionModel> subscribers;
  const SubscriptionLoadSuccess(this.subscribers);
  @override
  List<Object> get props => [subscribers];
}
class SubscriptionLoadError extends SubscriptionState {
  final String errorMessage;

 const SubscriptionLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
class SubscriptionCreationSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

const  SubscriptionCreationSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}
class SubscriptionCreationError extends SubscriptionState {
  final String errorMessage;

   const SubscriptionCreationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
class SubscriptionByIdSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

 const SubscriptionByIdSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}
class SubscriptionByIdError extends SubscriptionState {
  final String errorMessage;

   const SubscriptionByIdError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
class SubscriptionUpdateSuccess extends SubscriptionState {
  final SubscriptionModel subscriptionModel;

 const SubscriptionUpdateSuccess(this.subscriptionModel);

  @override
  List<Object> get props => [subscriptionModel];
}
class SubscriptionUpdateError extends SubscriptionState {
  final String errorMessage;

   const SubscriptionUpdateError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
class SubscriptionDeleteSuccess extends SubscriptionState {
  @override
  List<Object> get props => [];
}
class SubscriptionDeleteError extends SubscriptionState {
  final String errorMessage;

   const SubscriptionDeleteError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}