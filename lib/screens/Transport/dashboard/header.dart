import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class HeaderTransport extends StatelessWidget {
  const HeaderTransport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: SearchField(),
            width: 700,
          ),
        ),
        SizedBox(
          width: 250,
        ),
        Image(image: AssetImage('assets/images/translation.png')),
        Text(
          "Français(FR)",
          style: TextStyle(color: Colors.black),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        ),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Recherche quelque chose",
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Color(0XFFe3ebf3),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: Color(0XFFe3ebf3),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
