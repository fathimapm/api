import 'package:api_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:api_cubit/src/pages/login_Page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..checkAutoLogin(),
      child: MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.blue,

        ),
        home:  const LoginPage(),
        ),
      );

  }


}