import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({super.key});

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Feture"),
        centerTitle: true,

        actions: [
          IconButton(onPressed: ()async{

            SharedPreferences preferences = await SharedPreferences.getInstance();
            await preferences.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));




          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
