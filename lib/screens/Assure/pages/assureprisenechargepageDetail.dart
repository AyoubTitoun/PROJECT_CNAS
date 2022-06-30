import 'package:admin/screens/Assure/pages/assurepage.dart';
import 'package:admin/screens/ResponsableCNAS/buildingcontext/transport.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../dashboard/header.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../fixcomponents/Header.dart';
import '../main/main_screen.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

TextEditingController categorievehiculeController = TextEditingController();
TextEditingController motiftransport = TextEditingController();

double _originLatitude = 6.5212402;
double _originLongitude = 3.3679965;
double _destLatitude = 6.849660;
double _destLongitude = 3.648190;
Map<MarkerId, Marker> markers = {};
PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

Future<List<Transporteur>> fetchTransporteur() async {
  final response = await http.get(Uri.parse(uri + '/transporteurs'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Transporteur> transporteurs = [];
    var jsonData = jsonDecode(response.body);
    for (var transporteurElement in jsonData) {
      Transporteur transporteur = Transporteur(
          nomsociete: transporteurElement['nomsociete'],
          email: transporteurElement['email'],
          region: transporteurElement['region'],
          numerotelephone: transporteurElement['numerotelephone'],
          id: transporteurElement['idtransportsanitaire']);
      transporteurs.add(transporteur);
    }
    return transporteurs;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Transporteur {
  final int id;
  final String nomsociete;
  final String email;
  final String region;
  final String numerotelephone;

  const Transporteur({
    required this.id,
    required this.nomsociete,
    required this.email,
    required this.region,
    required this.numerotelephone,
  });
}

class DemandeClass {
  final int id;
  final String nommalade;

  const DemandeClass({
    required this.id,
    required this.nommalade,
  });
}

Future<Map<String,dynamic>> fetchDPC() async {
  final response = await http.post(Uri.parse(uri + '/dpc-by-id'),
  headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, int>{
                            "id" : 1
                          }),);
  
  if (response.statusCode == 200) {
    print(jsonDecode(response.body)[0]);
        print("HHHHHHHHHHHHHH");


    return jsonDecode(response.body)[0];
  } else {

    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}




class AssureprisenechargepageDetail extends StatefulWidget {
  final int iddemandeprisecharge;
  const AssureprisenechargepageDetail({Key? key , required this.iddemandeprisecharge}) : super(key: key );

  @override
  _assureprisenechargepageDetail createState() => _assureprisenechargepageDetail();
}


class _assureprisenechargepageDetail extends State<AssureprisenechargepageDetail> {
  String dropdownvalue = 'Ambulance médécalisé';
  var filteritems = [
    'Ambulance médécalisé',
    'Filtre 2',
    'Filtre 3',
    'Filtre 4',
  ];

  int? _categorie = 1;
  int? _motif = 1;
  int? _idTransportSanitaire ;
  TextEditingController maladeController = TextEditingController();
  TextEditingController adresseMaladeController = TextEditingController();
  TextEditingController sanitaireController = TextEditingController();
  TextEditingController adresseSanitaireController = TextEditingController();
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController nbrSeanceController = TextEditingController();
  int? _pourcentage = 1;
  int? _etat = 1;




  bool _selected = false;
  late Future<List<Transporteur>> futureTransporteur;
  late Future<Map<String,dynamic>> futureDpc;

  late GoogleMapController mapController;

  Set<Marker> _markers1 = Set();
  Set<Marker> _markers2 = Set();


  bool showmaps = true;
  //LatLng startLocation = LatLng(27.6683619, 85.3101895);
  //LatLng endLocation = LatLng(27.6688312, 85.3077329);
  String googleAPiKey = "AIzaSyDwCTYOj2SWL6bt2rz_k8_bcXirZtJNB3g";


  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? id_assure = prefs.getInt('id_assure');
  }

 

  @override
  void initState() {
    super.initState();
    // futureTransporteur = fetchTransporteur();
    futureDpc = fetchDPC();
    loadData();
    // Future<dynamic> dpcData = loadDataDpc();
    // print(dpcData);
  }


  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: FutureBuilder<Map<String,dynamic>>(
              future: futureDpc,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
              print(snapshot.data!['typeremboursement']);
              return Container(
                
                child: Text(snapshot.data!['categorievehicule'].toString()),
                  );
                } 
                
                return const CircularProgressIndicator();
              },
            ));
      
    
  }
}
