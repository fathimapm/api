import 'package:api_cubit/src/cubit/authentication/authentication_cubit.dart';
import 'package:api_cubit/src/models/user_model.dart';
import 'package:api_cubit/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileInfoWidget extends StatefulWidget {
  final UserResponse userResponse;
  const ProfileInfoWidget(this.userResponse,{Key? key}) : super(key: key);

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
    children: [
      ListTile(
        leading: Icon(Icons.person_pin),
        title: Text(widget.userResponse.name?? ""),
      ),
      const Divider(),
      ListTile(
        leading: Icon(Icons.maps_home_work_outlined),
        title: Text(widget.userResponse.getFullAddress()),
      ),
      const SizedBox(
        height: 200,
      ),
      AppButton(
         buttonName: "change Password",

          onTap:(){

          }),
      const SizedBox(
        height: 100,
      ),
      AppButton(
          buttonName: "Logout",
          onTap:(){
            context.read<AuthenticationCubit>().logout();

          }),
    ],
    )
    );
  }
}
