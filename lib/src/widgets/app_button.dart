  import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final Function onTap;
  const AppButton({required this.buttonName,required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          onTap();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle:const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold)),

        child: Text(buttonName));
  }
}
