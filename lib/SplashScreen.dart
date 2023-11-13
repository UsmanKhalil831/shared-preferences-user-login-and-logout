import 'dart:async';


import 'package:app/LoginScreen.dart';
import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    isLogin();
 }

 void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    if(isLogin == true){
      Timer(const Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const homeScreen()));//this file is manage the state of the user if user is not logged in, user will go to login screen
  }
  );
    }
    else{
       Timer(const Duration(seconds: 3), () { 
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
  }
  );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: double.infinity,width: double.infinity,
        child: Image.asset('assets/images/tree.jpeg'),
      ),
    );
  }
}