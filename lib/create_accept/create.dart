import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/lift.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateRides extends StatefulWidget {
  const CreateRides({Key? key}) : super(key: key);

  @override
  State<CreateRides> createState() => _CreateRidesState();
}

class _CreateRidesState extends State<CreateRides> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController rideTownController = TextEditingController();
  final TextEditingController pickupStreetController = TextEditingController();
  final TextEditingController dropoffStreetController = TextEditingController();
  final TextEditingController seatAvailableController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/pin.png',
                      height: 60,
                    ),
                    const SizedBox(height: 25),
                    const Text("Create Ride"),
                    const SizedBox(height: 45),
                    TextFormField(
                      autofocus: false,
                      controller: rideTownController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Destination Town");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        rideTownController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city,
                            color: Colors.purple[700]),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Car Ride Town Destination",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      autofocus: false,
                      controller: pickupStreetController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Destination Street");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        pickupStreetController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.turn_slight_left,
                            color: Colors.purple[700]),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Pick Up Street Location",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: dropoffStreetController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Destination");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        dropoffStreetController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.turn_slight_right,
                            color: Colors.purple[700]),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "End Destination Street",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: seatAvailableController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter number of seats available");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        seatAvailableController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.event_seat, color: Colors.purple[700]),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Number of seats",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onTap: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2099, 6, 7), onConfirm: (date) {
                          dateController.text = date.toIso8601String();
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      autofocus: false,
                      controller: dateController,
                      validator: (value) {
                        if (value!.isEmpty) {}
                        return ("Please Choose Date");
                      },
                      onSaved: (value) {
                        dateController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month,
                            color: Colors.purple[700]),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Date",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: costController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please enter cost of ride");
                        }

                        return null;
                      },
                      onSaved: (value) {
                        costController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.attach_money_outlined,
                            color: Colors.purple[700]),
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Cost",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.purple),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple[700],
                      child: MaterialButton(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          postDetailsToFirestore();
                        },
                        child: const Text(
                          "Send Offer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Hlulani rideOffers = Hlulani(
      id: user!.uid,
      uid: user.uid,
      departureDateTime: DateTime.parse(dateController.text),
      rideTown: rideTownController.text,
      departureStreet: pickupStreetController.text,
      arrivalStreet: dropoffStreetController.text,
      availableSeats: int.parse(seatAvailableController.text),
      costs: int.parse(costController.text),
    );

    await firebaseFirestore.collection("liftOffers").add(rideOffers.toMap());
    Fluttertoast.showToast(
        msg: "Ride offer created successfully :) ",
        backgroundColor: Colors.purple[200]);

    //   Navigator.pushAndRemoveUntil(
    //       (context),
    //       MaterialPageRoute(builder: (context) => const MyAccept()),
    //       (route) => false);
    // }
  }
}
