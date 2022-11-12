

import 'package:flutter/material.dart';

import 'package:ui_project/Screens/location.dart';
import 'package:ui_project/Screens/viewLand.dart';


class Office extends StatefulWidget {
  Office({Key? key,required this.CommercialName,required this.CommercialLocation,required this.CommercialImage,required this.locationLat,required this.locationLng}) : super(key: key);
  String CommercialName;
  var CommercialLocation;
  String CommercialImage;
  var locationLat,locationLng;


  @override
  State<Office> createState() => _OfficeState();
}

class _OfficeState extends State<Office> {



  int isFave = 1;

  int isFave1 = 1;

  int isFave2 = 1;

  int isFave3 = 1;

  int isFave4 = 1;

  var selected_index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      height: size.height * 0.25,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8)),

      child: Column(
        children: [

          Stack(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewLand()));
                  },
                  child: Container(
                    width: size.width * 0.45,
                    height: size.height * 0.17,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:NetworkImage(widget.CommercialImage),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(8)),
                  )

              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding:  EdgeInsets.only(right: size.width*.01,top: size.height*.003 ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isFave3 == 0) {
                          isFave3 = 1;
                        } else {
                          isFave3 = 0;
                        }
                        print(isFave3);
                      });
                    },
                    child: Container(
                      width: size.width * 0.06,
                      height: size.height * 0.03,
                      decoration: BoxDecoration(
                          color: isFave3 == 0 ? Colors.white : Colors.grey,
                          borderRadius: BorderRadius.circular(11)),
                      child: Center(
                          child: isFave3 == 0
                              ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 13,
                          )
                              : Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 13,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.CommercialName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Padding(
                  padding:  EdgeInsets.only(right: size.width*.02,top: size.height*.001),
                  child: Text(

                    "Rs.2500/Hr",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,
                        fontSize: 9),
                  ),
                ),
              ),
              
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Location1(locationLat: widget.locationLat,locationLng: widget.locationLng,  )));
            },
            child:  Padding(
              padding:  EdgeInsets.only(left: size.width*.019),
              child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.green,
                      size: 20,
                    ),
                    Text(
                      widget.CommercialLocation,
                      style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
            ),
            ),


        ],
      ),
    );
  }
}
