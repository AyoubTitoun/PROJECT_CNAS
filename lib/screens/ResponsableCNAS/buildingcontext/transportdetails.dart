import 'package:admin/screens/ResponsableCNAS/Assures/mainscreenassuredetails.dart';
import 'package:admin/screens/ResponsableCNAS/control/mainscreencontrol.dart';
import 'package:admin/screens/ResponsableCNAS/transport/mainscreentransport.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../controllers/MenuController.dart';
import '../transport/mainscreentransportdetails.dart';

class TransportDetails extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CNAS Website',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreenTransportDetails(),
      ),
    );
  }
}
