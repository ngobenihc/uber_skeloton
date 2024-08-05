import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';


class MyAccept extends StatefulWidget {
  const MyAccept({Key? key}) : super(key: key);

  @override
  State<MyAccept> createState() => _MyAcceptState();
}

class _MyAcceptState extends State<MyAccept> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController rideTownController = TextEditingController();
  final TextEditingController pickupStreetController = TextEditingController();
  final TextEditingController dropoffStreetController = TextEditingController();
  final TextEditingController seatAvailableController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  final TextEditingController searchController = TextEditingController();

  bool _isTouched = false;

  @override
  void dispose() {
    super.dispose();
    rideTownController.dispose();
    pickupStreetController.dispose();
    dropoffStreetController.dispose();
    seatAvailableController.dispose();
    timeController.dispose();
    dateController.dispose();
    costController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("liftOffers")
                    .snapshots(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/view');
                                },
                                child: Card(
                                  color: Colors.purple[50],
                                  elevation: 10,
                                  shadowColor: Colors.purple[200],
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.purple.shade50,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                "Ride Details",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.purple[900],
                                                    fontSize: 15),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    if (getDriverID() ==
                                                        getUserID()) {
                                                      rideTownController.text =
                                                          snapshot.data
                                                                  .docs[index]
                                                              ['rideTown'];
                                                      pickupStreetController
                                                          .text = snapshot
                                                              .data.docs[index]
                                                          ['departureStreet'];
                                                      dropoffStreetController
                                                          .text = snapshot
                                                              .data.docs[index]
                                                          ['departureDateTime'];
                                                      seatAvailableController
                                                              .text =
                                                          snapshot
                                                              .data
                                                              .docs[index][
                                                                  'availableSeats']
                                                              .toString();
                                                      dateController
                                                          .text = snapshot
                                                              .data.docs[index]
                                                          ['departureDateTime'];
                                                      costController.text =
                                                          snapshot
                                                              .data
                                                              .docs[index]
                                                                  ['costs']
                                                              .toString();
                                                      RideEdits(snapshot
                                                          .data.docs[index].id);
                                                    }
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: Colors.purple[900],
                                                ),
                                              ],
                                            ),
                                            Text(
                                                "Town Destination: ${snapshot.data.docs[index]['rideTown']}"),
                                            Text(
                                                "Departure street address: ${snapshot.data.docs[index]['departureStreet']}"),
                                            Text(
                                                "Arrival street address:${snapshot.data.docs[index]['arrivalStreet']}"),
                                            Text(
                                                "Departure Datetime: ${snapshot.data.docs[index]['departureDateTime']}"),
                                            Text(
                                                "Number of available seats: ${snapshot.data.docs[index]['availableSeats'].toString()}"),
                                            Text(
                                                "Cost of ride: ${snapshot.data.docs[index]['costs'].toString()}"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16.0),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.white,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    16),
                                                            topRight:
                                                                Radius.circular(
                                                                    16),
                                                          ),
                                                        ),
                                                        context: context,
                                                        isScrollControlled:
                                                            true,
                                                        builder:
                                                            (BuildContextcontext) =>
                                                                Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.65,
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          color: Colors.white,
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20),
                                                            child:
                                                                ElevatedButton(

                                                              onPressed: () {
                                                                _acceptance(snapshot.data.docs[index]);
                                                                Navigator.of(context).pop();
                                                                


                                                              },
                                                              child: const Text(
                                                                "Accept lift",
                                                              ),

                                                            ),

                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      Icons.car_crash,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  getDriverID() {
    FirebaseFirestore.instance
        .collection('liftOffers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["userId"]);
      });
    });
  }

  getUserID() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["uid"]);
      });
    });
  }

  String _formattedDepartureDateTime(DateTime datum) {
    String date = formatDate(datum, [dd, " ", MM, " ", yyyy]);
    String time = formatDate(datum, [HH, ':', nn]);

    return "$date at $time";
  }

  Future<void> _acceptance(
    dynamic rideDetail,
  ) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    dynamic passengers = rideDetail['passengers'];
    if (passengers.length - 1 == rideDetail['availableSeats']) {
      Fluttertoast.showToast(
          msg: 'Ride is full', backgroundColor: Colors.purple[200]);
      return;
    }
    if (!passengers.contains(user!.uid)) {
      passengers.add(user.uid);
    } else {
      Fluttertoast.showToast(
          msg: 'You are one of the passengers/driver',
          backgroundColor: Colors.purple[200]);
      return;
    }

    await FirebaseFirestore.instance
        .collection('liftOffers')
        .doc(rideDetail.id)
        .update({'passengers': passengers});

    Fluttertoast.showToast(
        msg: 'Ride booked', backgroundColor: Colors.purple[200]);
  }

  RideEdits(String docId) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                    prefixIcon:
                        Icon(Icons.route_rounded, color: Colors.purple[700]),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Car Ride Town Destination",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                    prefixIcon:
                        Icon(Icons.route_rounded, color: Colors.purple[700]),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Pick Up Street Location",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                    prefixIcon:
                        Icon(Icons.route_rounded, color: Colors.purple[700]),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "End Destination Street",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Number of seats",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                      dateController.text = _formattedDepartureDateTime(date);
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
                    prefixIcon:
                        Icon(Icons.calendar_month, color: Colors.purple[700]),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Date",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
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
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Cost",
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple[700],
                  child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("liftOffers")
                          .doc(docId)
                          .update(
                        {
                          'rideTown': rideTownController.text,
                          'departureStreet': pickupStreetController.text,
                          'arrivalStreet': dropoffStreetController.text,
                          'availableSeats': seatAvailableController.text,
                          'departureDateTime': dateController.text,
                          'costs': costController.text,
                        },
                      ).then(
                        (value) {
                          rideTownController.text = '';
                          pickupStreetController.text = '';
                          dropoffStreetController.text = '';
                          seatAvailableController.text = '';
                          dateController.text = '';
                          costController.text = '';
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    child: const Text(
                      "Update Offer",
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
    );
  }
}