import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/Assure/buildingcontext/priseencharge.dart';
import 'package:admin/screens/Assure/pages/assureprisenechargepage.dart';
import 'package:admin/screens/ResponsableCNAS/pages/assurepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/dashboard_screen.dart';
import '../fixcomponents/Header.dart';
import '../fixcomponents/side_menu.dart';
import '../pages/assurepage.dart';
import '../pages/transportpage.dart';


class MainTransportAssure extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: backgroundColorCnas,
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenuAssure(),
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColorCnas,
        ),
        child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenuAssure(),
              ),
            
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: TransportpageAssure(),
            ),
          ],
        ),
      ),
        
      ),
    );
    // return Scaffold(
    //   key: context.read<MenuController>().scaffoldKey,
    //   drawer: SideMenuAssure(),
    //   body: SafeArea(
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // We want this side menu only for large screen
    //         if (Responsive.isDesktop(context))
    //           Expanded(
    //             // default flex = 1
    //             // and it takes 1/6 part of the screen
    //             child: SideMenuAssure(),
    //           ),
    //         Expanded(
    //           // It takes 5/6 part of the screen
    //           flex: 5,
    //           child: DashboardScreenAssure(),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
