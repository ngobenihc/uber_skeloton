
import 'package:flutter/material.dart';
import 'package:flutter_application_1/create_accept/accept.dart';
import 'package:flutter_application_1/create_accept/create.dart';

import '../driverProfilepage/driver_home.dart';
import '../driverProfilepage/driver_profile.dart';




class DriverMainScreen extends StatefulWidget {
  //const MainScreen({Key? key}) : super(key: key);

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> with SingleTickerProviderStateMixin{

  TabController? tabController;
  int setectedIndex =0;

  onItemClicked(int index){
    setState(() {
      setectedIndex = index;
      tabController!.index = setectedIndex;
    });
  }

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          Driverhome(),
          CreateRides(),
          MyAccept(),
          DriverProfile(),
          


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"Home"),


          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label:"Creating Ride"),

          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label:"Account"),    

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"Account"),
        ],
        unselectedItemColor: Colors.orange,
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:const TextStyle(fontSize: 12),
        showUnselectedLabels: true,
        currentIndex: setectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
