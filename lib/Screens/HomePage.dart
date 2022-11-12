import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ui_project/widgets/Land.dart';
import 'package:ui_project/widgets/Office.dart';
import 'package:ui_project/widgets/industrialLnad.dart';

class Uisample extends StatefulWidget {
  const Uisample({Key? key}) : super(key: key);

  @override
  State<Uisample> createState() => _UisampleState();
}

class _UisampleState extends State<Uisample> {
  static var location = [];
  static var image = [];
  static var locationLat = [];
  static var locationLng = [];

  Future<dynamic> getdata() async {
    String url = "https://api.xentice.com/api/postadSelect";
    var res = await get(
      Uri.parse(url),
    );
    var api = jsonDecode(res.body);
    List name = [];
    for (var i in api) {
      print(jsonDecode(i["propertyType"])["name"]);

      name.add(jsonDecode(i["propertyType"])["name"]);
      image.add(jsonDecode(i["images"])[0]);

      location.add(jsonDecode(i["location"])["city"]);
      locationLat.add(
          ((jsonDecode(i["location"])["cord"])["location"])["lat"]);
      locationLng.add(
          ((jsonDecode(i["location"])["cord"])["location"])["lng"]);
    }

    print(name.length);
    return name;
  }

  //
  int isFave = 0;
  int isFave1 = 0;
  int isFave2 = 0;
  int isFave3 = 0;
  int isFave4 = 0;
  var selected_index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white60,
        leading: Icon(Icons.sort, color: Colors.indigo, size: 30),
        title: Text("Xentice",
            style: GoogleFonts.comfortaa(
                color: Colors.blue.shade700,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * .02),
            child: CircleAvatar(
              foregroundImage: AssetImage('asset/images.jpg'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.05,
              margin: EdgeInsets.fromLTRB(13, 9, 10, 5),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    )),
              ),
            ),
            Row(
              children: [IndustrialLand()],
            ),
            Container(height: size.height * .12, child: Land()),
            SizedBox(height: size.height * .03),
            //Commercial office
            Padding(
              padding: EdgeInsets.only(left: size.width * .01),
              child: Text(
                'Commercial Office',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Align(
              alignment: Alignment(1, 0),
              child: Padding(
                padding: EdgeInsets.only(right: size.width * .03),
                child: Text(
                  'see all',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black54),
                ),
              ),
            ),

            SizedBox(
              height: size.height * .01,
            ),

            SizedBox(
              height: size.height * .02,
            ),
            Container(
              height: size.height * .28,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Container(
                  height: size.height * .1,
                  child: FutureBuilder(
                      future: getdata(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('data');
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // isSelected=index;
                                    // setState(() {

                                    // });
                                  },
                                  child: Office(
                                    CommercialName: snapshot.data[index],
                                    CommercialLocation: location[index],
                                    CommercialImage: image[index],
                                    locationLat: locationLat[index],
                                    locationLng: locationLng[index],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: size.width * .03),
                              itemCount: snapshot.data.length);
                        }
                      }),
                ),
              ),
            ),

            SizedBox(height: size.height * .03),
            Padding(
              padding: EdgeInsets.only(left: size.width * .02),
              child: Text(
                'Commercial Office',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Align(
              alignment: Alignment(1, 0),
              child: Padding(
                padding: EdgeInsets.only(right: size.width * .03),
                child: Text(
                  'see all',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black54),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),

            Container(
              height: size.height * .28,
              child: FutureBuilder(
                  future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('data');
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  // isSelected=index;
                                  // setState(() {

                                  // });
                                },
                                child: Office(
                                  CommercialName: snapshot.data[index],
                                  CommercialLocation: location[index],
                                  CommercialImage: image[index],
                                  locationLat: locationLat[index],
                                  locationLng: locationLng[index],
                                ));
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: size.width * .03),
                          itemCount: snapshot.data.length);

                      // child: Container(
                      //   width: double.infinity,
                      //   height: double.infinity,
                      //   decoration: BoxDecoration(color: Colors.cyanAccent),
                      // ),

                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
