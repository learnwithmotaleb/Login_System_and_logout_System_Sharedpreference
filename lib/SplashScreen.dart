import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference2/dashboard.dart';
import 'package:sharedpreference2/login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  static const String KEYLOGIN = "login";

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();


  @override
  void initState() {
    super.initState();
   whereToGo();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child){
                  return Transform.translate(
                    offset: Offset.zero,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Center(
                        child: Image.asset('assets/image/logo.png',),
                      ),
                    ),
                  );

                }

            ),

          ],
        ),
      ),
    );
  }

  void whereToGo() async{

    var share = await SharedPreferences.getInstance();
    var isLoggedIn = share.getBool(KEYLOGIN);



    Timer(Duration(seconds:3),(){

      if(isLoggedIn != null){

        if(isLoggedIn){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Dashboard_Screen()));
        }else{
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Login_Screen()));
        }

      }else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Login_Screen()));
      }

    });




  }
}