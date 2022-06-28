// import 'package:flutter/material.dart';

// import '../buildingcontext/assuredetails.dart';
// import '../../../constants.dart';
// import '../dashboard/header.dart';

// class assuredetailspage extends StatefulWidget {
//   const assuredetailspage({Key? key}) : super(key: key);

//   @override
//   _assuredetailspage createState() => _assuredetailspage();
// }

// class _assuredetailspage extends State<assuredetailspage> {
//   String dropdownvalue = 'Filtre 1';
//   var filteritems = [
//     'Filtre 1',
//     'Filtreeeeeeeeeeeeeee 2',
//     'Filtre 3',
//     'Filtre 4',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         primary: false,
//         padding: EdgeInsets.all(defaultPadding),
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(0),
//               child: Header(),
//             ),
//             SizedBox(height: defaultPadding + 10),
//             Container(
//               padding: EdgeInsets.all(8),
//               alignment: Alignment.topLeft,
//               child: Row(
//                 children: [
//                   Text(
//                     "Détails de l'assuré ",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   //SizedBox(width: (MediaQuery.of(context).size.width) / 2),
//                   SizedBox(
//                     width: 617,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 10, right: 10),
//                     decoration: BoxDecoration(
//                         boxShadow: <BoxShadow>[
//                           //apply shadow on Dropdown button
//                           BoxShadow(
//                               color: Color.fromRGBO(
//                                   0, 0, 0, 0.57), //shadow for button
//                               blurRadius: 5) //blur radius of shadow
//                         ],
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.black38, width: 1)),
//                     child: DropdownButton(
//                         dropdownColor: Colors.white,
//                         style: TextStyle(color: Colors.black),
//                         iconEnabledColor: Colors.black,
//                         // Initial Value
//                         value: dropdownvalue,

//                         // Down Arrow Icon
//                         icon: const Icon(Icons.keyboard_arrow_down),

//                         // Array list of items
//                         items: filteritems.map((String items) {
//                           return DropdownMenuItem(
//                             value: items,
//                             child: Text(items),
//                           );
//                         }).toList(),
//                         // After selecting the desired option,it will
//                         // change button value to selected value
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             dropdownvalue = newValue!;
//                           });
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: defaultPadding),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../buildingcontext/assuredetails.dart';
import '../../../constants.dart';
import '../dashboard/header.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<Albums> fetchAssures() async {
//   final response = await http
//       .get(Uri.parse('http://localhost:3000/assures'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Albums.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
Future<List<Assure>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://localhost:3000/assures'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Assure> assures = [];
    var jsonData = jsonDecode(response.body);
    for ( var assureElement in jsonData){
      // print(assureElement);
      // print(assureElement['nss']);
      // assures.add();
      // assures.add(Assure));
      Assure assure = Assure(nss: assureElement['nss'], firstname: assureElement['firstname'],  lastname: assureElement['lastname'], id : assureElement['id']);
      assures.add(assure);
      // print(assureElement);
    }  
    print(assures[0].firstname);
    return assures;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class Assure {
  final int id;
  final String nss;
  final String firstname ;
  final String lastname ;

  const Assure({
    required this.id,
    required this.nss,
    required this.firstname,
    required this.lastname,
  });

  factory Assure.fromJson(Map<String, dynamic> json) {
    return Assure(
      id: json['id'],
      nss: json['nss'],
      firstname: json['firstname'],
      lastname: json['lastname']);
  }
}

// getAssures() async {
//     var response = await http.get(Uri.parse('http://localhost:3000/assures'));
//     var jsonData = jsonDecode(response.body);
//     List<Assure> assures = [];
//     print(assures);
    
//     return assures;
// }

class assuredetailspage extends StatefulWidget {
  const assuredetailspage({Key? key}) : super(key: key);

  @override
  _assuredetailspage createState() => _assuredetailspage();
}

class _assuredetailspage extends State<assuredetailspage> {
  late Future<List<Assure>> futureAssures;

  @override
  void initState() {
    super.initState();
    futureAssures = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Assure>>(
            future: futureAssures,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text("kayen data");
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

