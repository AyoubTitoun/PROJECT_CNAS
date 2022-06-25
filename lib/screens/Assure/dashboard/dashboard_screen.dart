import 'package:admin/screens/Assure/dashboard/header.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DashboardScreenAssure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              child: HeaderAssure(),
            ),
            SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
