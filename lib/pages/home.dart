import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/lifts_view_model.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<LiftsViewModel>(
      builder: (context, fuelPriceModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Text('I need a lift!')
              ],
            ),
          ),
        );
      }
    );
  }
}
