import 'package:api_cubit/src/fragments/category_fragment.dart';
import 'package:api_cubit/src/fragments/profile_fragment.dart';
import 'package:api_cubit/src/fragments/subscription_fragment.dart';
import 'package:api_cubit/src/fragments/home_fragment.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    List<Widget> fragments =[HomeFragment(),CategoryFragment(),SubscriptionFragment(),ProfileFragment()];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home page"),
      ),
      body:

     fragments[selectedIndex],




    bottomNavigationBar: BottomNavigationBar(
    currentIndex:selectedIndex,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    type: BottomNavigationBarType.fixed,
    unselectedLabelStyle: TextStyle(color: Colors.grey),
    selectedLabelStyle: TextStyle(color: Colors.blue),
    onTap: (value){

    setState(() {
    selectedIndex = value;
    });
    },

    elevation: 6,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
      ),
    BottomNavigationBarItem(
    icon: Icon(Icons.category_sharp),
    label: "Category"
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.subscriptions_rounded),
    label: "Subscription",

    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "Profile"
    ),
    ],

    ),
    );
  }
}