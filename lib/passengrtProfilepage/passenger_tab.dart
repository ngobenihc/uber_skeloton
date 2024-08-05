import 'package:flutter/cupertino.dart';

class PassengerRating extends StatefulWidget {
  const PassengerRating({Key? key}) : super(key: key);

  @override
  State<PassengerRating> createState() => _PassengerRatingState();
}

class _PassengerRatingState extends State<PassengerRating> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("passenger"),);
  }
}
