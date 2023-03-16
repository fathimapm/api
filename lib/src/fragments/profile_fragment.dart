import 'package:api_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:api_cubit/src/cubit/profile/profile_cubit.dart';
import 'package:api_cubit/src/pages/login_Page.dart';
import 'package:api_cubit/src/widgets/app_load_error.dart';
import 'package:api_cubit/src/widgets/app_loader.dart';
import 'package:api_cubit/src/widgets/profile/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFragment extends StatefulWidget {
  @override
  createState() => _ProfileFragmentState();

}

class _ProfileFragmentState extends State<ProfileFragment> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          ProfileCubit()
            ..getProfileInfo(),
        ),
        //   BlocProvider(
        // create: (context) => AuthenticationCubit(),
        //  ),
      ],
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if(state is AuthenticationInitial){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginPage(),));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text("Profile"),),
          body: SafeArea(
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const AppLoader();
                  }
                  else if (state is ProfileLoadError) {
                    return AppLoadErrorWidget(
                        errorMessage: "something went wrong, please try again",
                        buttonLabel: "Login",
                        onButtonTap: () {

                        }

                    );
                  } else if (state is ProfileLoadSuccess) {
                    return ProfileInfoWidget(state.userResponse);
                  } else {
                    return const AppLoader();
                  }
                  return Column(
                    children: [
                      Row(

                      )
                    ],
                  );
                },
              )
          ),
        ),
      ),
    );
  }
}