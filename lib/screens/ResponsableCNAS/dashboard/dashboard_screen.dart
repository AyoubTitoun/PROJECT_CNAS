import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants.dart';
import 'header.dart';

double _originLatitude = 6.5212402;
double _originLongitude = 3.3679965;
double _destLatitude = 6.849660;
double _destLongitude = 3.648190;
Map<MarkerId, Marker> markers = {};
PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

String dropdownvalue = 'Filtre 1';
var filteritems = [
  'Filtre 1',
  'Filtreeeeeeeeeeeeeee 2',
  'Filtre 3',
  'Filtre 4',
];

class DashboardScreenResponsable extends StatefulWidget {
  const DashboardScreenResponsable({Key? key}) : super(key: key);

  @override
  _transportpage createState() => _transportpage();
}

class _transportpage extends State<DashboardScreenResponsable> {
  //Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 9.4746,
  );
  late GoogleMapController mapController;

  Set<Marker> _markers = Set();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();

  bool showmaps = true;
  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6688312, 85.3077329);
  String googleAPiKey = "AIzaSyDwCTYOj2SWL6bt2rz_k8_bcXirZtJNB3g";

  @override
  // void initState() {
  //   super.initState();

  //   _markers.add(Marker(
  //     //add start location marker
  //     markerId: MarkerId(startLocation.toString()),
  //     position: startLocation, //position of marker
  //     infoWindow: InfoWindow(
  //       //popup info
  //       title: 'Starting Point ',
  //       snippet: 'Start Marker',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //   ));

  //   _markers.add(Marker(
  //     //add distination location marker
  //     markerId: MarkerId(endLocation.toString()),
  //     position: endLocation, //position of marker
  //     infoWindow: InfoWindow(
  //       //popup info
  //       title: 'Destination Point ',
  //       snippet: 'Destination Marker',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //   ));

  //   //_markers.add(Marker(
  //   // markerId: MarkerId("mylocation"), position: LatLng(36.7762, 3.05997)));
  // }
  @override
  void initState() {
    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );

    _getPolyline();

    print("Enter at getpoly");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      child: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Container(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(0),
                child: Header(),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: defaultPadding + 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Dashboard ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FloatingActionButton.extended(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          backgroundColor: Colors.red,
                          onPressed: () {},
                          label: Text(
                            "Télécharger rapport",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          icon: Icon(
                            Icons.print,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "aperçu des données de l'inventaire",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 250,
                          height: 200,
                          child: Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.green),
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/assuredashboard.png'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Assuré",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.black),
                                ),
                                Text(
                                  "2556",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 21,
                                ),
                                SizedBox(
                                  width: 249,
                                  height: 34,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.5)),
                                    child: Center(
                                      child: Text(
                                        "Voir Plus >>",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.cyan),
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/medical_dashboard.png'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Transport sanitaire",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.black),
                                ),
                                Text(
                                  "120",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 249,
                                  height: 34,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.cyan.withOpacity(0.5)),
                                    child: Center(
                                      child: Text(
                                        "Voir Plus >>",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.yellow),
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/paymentsdasboard.png'),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Demandes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.black),
                                ),
                                Text(
                                  "8709096079",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 249,
                                  height: 34,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.yellow.withOpacity(0.5)),
                                    child: Center(
                                      child: Text(
                                        "Voir Plus >>",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 250,
                          height: 200,
                          child: Card(
                            borderOnForeground: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.red),
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/warning_dashboard.png'),
                                  // height: 90,
                                  //width: 90,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Réclamation",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      color: Colors.black),
                                ),
                                Text(
                                  "80",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 249,
                                  height: 34,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.5)),
                                    child: Center(
                                      child: Text(
                                        "Voir Plus >>",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: defaultPadding * 2,
                    ),
                    Container(
                        width: 400,
                        height: 435,
                        margin: const EdgeInsets.all(0.0),
                        padding: const EdgeInsets.only(
                            right: 0, left: 0, top: 0, bottom: 0),
                        decoration: BoxDecoration(border: Border.all()),
                        child: showmaps
                            ? Container(
                                padding: EdgeInsets.all(0),
                                // child: GoogleMap(
                                //   onMapCreated: (controller) {
                                //     setState(() {
                                //       mapController = controller;
                                //     });
                                //   },
                                //   markers: Set<Marker>.of(_markers),
                                //   mapType: MapType.terrain,
                                //   initialCameraPosition: CameraPosition(
                                //       target: LatLng(36.7762, 3.05997), zoom: 13),
                                // ),
                                // child: GoogleMap(
                                //   //Map widget from google_maps_flutter package
                                //   zoomGesturesEnabled: true,
                                //   polylines: _polylines, //enable Zoom in, out on map
                                //   initialCameraPosition: CameraPosition(
                                //     //innital position in map
                                //     target: startLocation, //initial position
                                //     zoom: 16.0, //initial zoom level
                                //   ),
                                //   markers: _markers, //markers to show on map
                                //   //polylines
                                //   mapType: MapType.normal, //map type
                                //   onMapCreated: (controller) {
                                //     //method called when map is created
                                //     setState(() {
                                //       mapController = controller;
                                //     });
                                //     setPolylines();
                                //   },
                                // ))
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: _kGooglePlex,
                                  myLocationEnabled: true,
                                  tiltGesturesEnabled: true,
                                  compassEnabled: true,
                                  scrollGesturesEnabled: true,
                                  zoomGesturesEnabled: true,
                                  polylines: Set<Polyline>.of(polylines.values),
                                  markers: Set<Marker>.of(markers.values),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    GoogleMapController;
                                  },
                                ),
                              )
                            : CircularProgressIndicator(
                                color: Colors.amber,
                              )),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDwCTYOj2SWL6bt2rz_k8_bcXirZtJNB3g",
        PointLatLng(startLocation.latitude, startLocation.longitude),
        PointLatLng(endLocation.latitude, endLocation.longitude));
    print("/////////////////////////////////////////////////////////");
    if (result.status == "OK") {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 10,
            color: Colors.red,
            polylineId: PolylineId("polyline"),
            points: polylineCoordinates));
      });
    }
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyDwCTYOj2SWL6bt2rz_k8_bcXirZtJNB3g", // My google API key
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }
}
