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


class Assure {
  final int id;
  final String nss;
  final String firstname ;
  final String lastname ;
  // final String region ;

  const Assure(
    this.id,
    this.nss,
    this.firstname,
    this.lastname,
    // required this.region
  );

  // factory Assure.fromJson(Map<String, dynamic> json) {
  //   return Assure(
  //     id: json['id'],
  //     nss: json['nss'],
  //     firstname: json['firstname'],
  //     lastname: json['lastname'],
  //     // region: json['region']
  //   );
  // }
}
class assuredetailspage extends StatefulWidget {
  const assuredetailspage({Key? key}) : super(key: key);

  @override
  _assuredetailspage createState() => _assuredetailspage();
}

class _assuredetailspage extends State<assuredetailspage> {
  
  getAssures() async {
    var response = await http.get(Uri.parse('http://localhost:3000/assures'));
    var jsonData = jsonDecode(response.body);
    List<Assure> assures = [];
    for ( var assureElement in jsonData){
      Assure assure = Assure(assureElement['id'],assureElement['nss'],assureElement['firstname'],assureElement['lastname']);
      assures.add(assure);
    }  

    return assures;
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
        body: Container(
          child: Card(child: FutureBuilder<List<Assure>>(
          future: getAssures(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount: snapshot.data!.length , itemBuilder: (context,i){
                return ListTile(title: Text(snapshot.data![i].firstname),);
              });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )
          ),
        ),
      ),
    );
  }
}
