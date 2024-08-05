import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainpage/mainpage.dart';





class PassengerProfile extends StatefulWidget {
  const PassengerProfile({super.key});

  @override
  State<PassengerProfile> createState() => _PassengerProfileState();
}

class _PassengerProfileState extends State<PassengerProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(

    onPressed: () {
      // fAth.signOut();

      Navigator.push(context, MaterialPageRoute(builder:(c)=> MyMainPage()));

    },
    child:const Text("Logout"),
    ),
    );
  }
}
