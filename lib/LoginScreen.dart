import 'package:app/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  setvalues()async{
    SharedPreferences sp = await SharedPreferences.getInstance(); // ye future return karta hai isliay async await lagaengay
    sp.setString('email',emailController.text );
    sp.setBool('isLogin', true);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const homeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen'),automaticallyImplyLeading: false,),
      body: Container(padding: EdgeInsets.all(20),
        child: Column(
        children: [
          TextField(controller: emailController,
          decoration: const InputDecoration(hintText: 'email'),),
          SizedBox(height: 20,),
          TextField(controller: passwordController,
          decoration: const InputDecoration(hintText: 'password'),),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){
            setvalues();
          }, child: const Text('Log In'))
        ],
      ),),
    );
  }
}