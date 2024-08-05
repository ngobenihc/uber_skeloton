import 'package:flutter/material.dart';

import '../create_accept/accept.dart';
import '../passengrtProfilepage/passenger_earning.dart';
import '../passengrtProfilepage/passenger_home.dart';
import '../passengrtProfilepage/search.dart';

class PassengerMainScreen extends StatefulWidget {
  const PassengerMainScreen({super.key});

  //const MainScreen({Key? key}) : super(key: key);

  @override
  State<PassengerMainScreen> createState() => _PassengerMainScreenState();
}

class _PassengerMainScreenState extends State<PassengerMainScreen> with SingleTickerProviderStateMixin{

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
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          PassengerHome(),
          MySearches(),
          MyAccept(),
          PassengerEarnig(),


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"Home"),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"search"),
    

          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label:"Accept left"),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"Profile"),

          
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
