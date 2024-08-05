import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainpage/mainpage.dart';


import '../slap_sreen/splash_screen.dart';



class DriverProfile extends StatefulWidget {
  const DriverProfile({Key? key}) : super(key: key);

  @override
  State<DriverProfile> createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
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
