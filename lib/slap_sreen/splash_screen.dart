import 'dart:async';

import 'package:flutter/material.dart';

import '../mainpage/mainpage.dart';





class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){
    Timer(const Duration(seconds: 1),() async {
      //send user to home screen
       Navigator.push(context, MaterialPageRoute(builder:(c)=> MyMainPage()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material( child: Container(
      color: Colors.teal,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(child: Padding(
            //   padding: const EdgeInsets.all(64.0),
            //   child: Image.asset("images/Ford.jpg"),
            // )),
            Text("Cliff Ride", style: TextStyle(fontSize: 20,),),


          ],
        ),
      ),
    ),
    );
  }
}
