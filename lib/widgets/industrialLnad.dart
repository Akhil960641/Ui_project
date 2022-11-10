import 'package:flutter/material.dart';

class IndustrialLand extends StatefulWidget {
   IndustrialLand({Key? key}) : super(key: key);

  @override
  State<IndustrialLand> createState() => _IndustrialLandState();
}

class _IndustrialLandState extends State<IndustrialLand> {
  int isFave = 0;

  int isFave1 = 0;

  int isFave2 = 0;

  int isFave3 = 0;

  int isFave4 = 0;

  var selected_index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (isFave4 == 0) {
                isFave4 = 1;
              } else {
                isFave4 = 0;
              }
              print(isFave4);
            });
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(11, 9, 4, 5),
            width: 120,
            height: 35,
            child: Center(
                child: Text(
                  "Property",
                  style: TextStyle(
                      color: isFave4 == 0 ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            decoration: BoxDecoration(
              // color: Colors.redAccent,
              border: Border.all(
                color: isFave4 == 0
                    ? Colors.grey.shade300
                    : Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (isFave4 == 0) {
                isFave4 = 1;
              } else {
                isFave4 = 0;
              }
              print(isFave3);
            });
          },
          child: Container(
            width: 120,
            height: 35,
            child: Center(
                child: Text(
                  "Services",
                  style: TextStyle(
                      color: isFave4 == 0 ? Colors.grey : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            decoration: BoxDecoration(
              // color: Colors.redAccent,
              border: Border.all(
                color: isFave4 == 1
                    ? Colors.grey.shade300
                    : Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
