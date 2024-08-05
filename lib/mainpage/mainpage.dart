

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/leftlogin.dart';
import '../login/leftsingup.dart';
import '../login/passengerlogin.dart';
import '../login/passengersignup.dart';

class MyMainPage extends StatefulWidget {


  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Center(child: Text("pick the one lift giver or passenger ")),),
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [

              const SizedBox(height: 10),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder:(c)=> const LiftLoginScreen()));


                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey
                    ),
                    child: const Text("LogIn as a driver"),
                  ),


                  ElevatedButton(onPressed: (){


                    Navigator.push(context, MaterialPageRoute(builder:(c)=> const PassengerLoginScreen()));


                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey
                    ),
                    child: const Text("LogIn as passenger"),
                  ),
                ],
              ),


              const SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder:(c)=>const LeftSignUpScreen()));


                  },
                    child:const Text("I don't have an account as a driver", style: TextStyle(color: Colors.white),),
                  ),



                  TextButton(onPressed: (){


                    Navigator.push(context, MaterialPageRoute(builder:(c)=> const PassengerSignUpScreen()));


                  },
                    child:const Text("I don't have an account as a passenger", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
