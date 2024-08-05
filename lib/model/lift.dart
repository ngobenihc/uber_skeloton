class Hlulani {
  String id;
  String uid;

  DateTime departureDateTime;
  String rideTown;
  String departureStreet;
  String arrivalStreet;
  int availableSeats;
  int costs;

  // id: user!.uid,
  //       userId: user.uid,
  //       departureDateTime: DateTime.parse(dateController.text),
  //       rideTown: rideTownController.text,
  //       departureStreet: pickupStreetController.text,
  //       arrivalStreet: dropoffStreetController.text,
  //       availableSeats: int.parse(seatAvailableController.text),
  //       costs: int.parse(costController.text),

  Hlulani({required this.uid, required this.id, required this.departureStreet, required this.rideTown, required this.departureDateTime, required this.arrivalStreet, required this.availableSeats, required this.costs});

  // receiving data from server
  factory Hlulani.fromMap(map) {
    return Hlulani(
      uid: map['uid'],
      id: map['id'],
      departureDateTime: DateTime.parse(map['departureDateTime'] as String),
      rideTown: map['rideTown'],
      arrivalStreet: map['arrivalStreet'],
      departureStreet: map['departureStreet'],
      costs: map['costs'],


      availableSeats: map['availableSeats'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'id': id,
      'departureDateTime': departureDateTime,
      'rideTown': rideTown,
      'arrivalStreet': arrivalStreet,
      'departureStreet': departureStreet,
      'costs': costs,


      'availableSeats': availableSeats,
    };
  }
}