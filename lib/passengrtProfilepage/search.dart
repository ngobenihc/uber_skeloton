
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MySearches extends StatefulWidget {
  const MySearches({Key? key}) : super(key: key);

  @override
  State<MySearches> createState() => _MySearchesState();
}

class _MySearchesState extends State<MySearches> {
  final TextEditingController searchController = TextEditingController();

  List searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextFormField(
                autofocus: false,
                controller: searchController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please ride town location");
                  }

                  return null;
                },
                onChanged: (query) {
                  searchFromFirebase(query);
                },
                onSaved: (value) {
                  searchController.text = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.purple[200]),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  hintText: "Search for rides",

                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    if( searchResults.isNotEmpty) {
                     
                              return ListTile(

                                title: Text(
                                  "Pick up town:  ${searchResults[index]['rideTown']}",
                                  style: const TextStyle(fontSize: 17),
                                ),
                                // write


                                
                                subtitle: Text(
                                  "Pick up street: ${searchResults[index]['departureStreet']}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                      );
                    }else{
                      return  Center(
                        child: Container(
                          child: const Text("No search results yet"),

                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  searchFromFirebase(String query) async {
    final res = await FirebaseFirestore.instance
        .collection("liftOffers")
        .where("rideTown", isEqualTo: query)
        .get();

    setState(() {
      searchResults = res.docs.map((e) => e.data()).toList();
    });
  }
}