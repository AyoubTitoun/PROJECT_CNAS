import 'package:admin/screens/Assure/dashboard/header.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class DashboardScreenAssure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Container(
        color: primaryColor,
        margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        padding: EdgeInsets.fromLTRB(20,7.5,10,0),
        child: SingleChildScrollView(
          primary: false,
          
          child: Column(
            children: [
              Container(
                // height: 65,
                // width: 65,
                child: HeaderAssure(),
              ),
              SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
