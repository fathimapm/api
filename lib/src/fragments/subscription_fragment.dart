import 'package:api_cubit/src/cubit/subscription/subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionFragment extends StatefulWidget {
  @override
  createState() => _SubscriptionFragmentState();

}

class _SubscriptionFragmentState extends State<SubscriptionFragment> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubscriptionCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Subscription"),),
        body: SafeArea(
          child: Text("Subscription"),
        ),

      ),
    );
  }



}