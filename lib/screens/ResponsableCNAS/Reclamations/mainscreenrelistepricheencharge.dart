import 'package:admin/controllers/MenuController.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/ResponsableCNAS/dashboard/dashboard_screen.dart';
import 'package:admin/screens/ResponsableCNAS/fixcomponents/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/controlpage.dart';
import '../pages/listeenchargepage.dart';
import '../pages/reclamationpage.dart';
import '../pages/transportpage.dart';

class MainScreenListePriseEnCharge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: listepriseenchargepage(),
            ),
          ],
        ),
      ),
    );
  }
}
