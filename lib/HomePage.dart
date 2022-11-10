import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ui_project/viewLand.dart';
import 'package:ui_project/widgets/Commercial_office.dart';
import 'package:ui_project/widgets/Land.dart';
import 'package:ui_project/widgets/industrialLnad.dart';
import 'location.dart';

class UiSample extends StatefulWidget {
  const UiSample({Key? key}) : super(key: key);

  @override
  State<UiSample> createState() => _UiSampleState();
}
class _UiSampleState extends State<UiSample> {

  List<dynamic> myMap=[];

  Future<dynamic> getdata() async {

    String url = "https://api.xentice.com/api/postadSelect";
    var res = await get(Uri.parse(url),);
    var api = jsonDecode(res.body);
    print(api);

    // setState(() {
    //   Map<String,dynamic>  a=jsonDecode(jsonDecode('location'));
    //   print(a);
    //   print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>jj');
    // });

    // Map<String,dynamic>  a=jsonDecode(jsonDecode('propertyType'));
    // print(a);
    // print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>jj');


    // final Url = "https://api.xentice.com/api/postadSelect";
    // var response = await get(Uri.parse(Url));
    // print("sbsvj");
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     print("sbsvj");
  //     return jsonDecode(response.body);
  //     // print('dfgdnfsg<<');
  //   }
   }

  @override
  void initState() {
    getdata();
    super.initState();

  }

  int isFave = 0;
  int isFave1 = 0;
  int isFave2 = 0;
  int isFave3 = 0;
  int isFave4 = 0;
  var selected_index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white60,
          leading: Icon(Icons.sort,color: Colors.indigo,size: 30),
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
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      )),
                ),
              ),
              Row(
                children: [
                  IndustrialLand()
                ],
              ),
              Container(
                height: size.height*.12,
                child:Land()
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.height * 0.01, top: size.height * 0.03),
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      child: Text(
                        "Commercial Office",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * .8, top: size.height * 0.05),
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      child: Text(
                        "see all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.09, left: size.height * 0.02),
                        child: Container(
                          width: size.width * 0.45,
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.09,
                              left: size.height * 0.01),
                          child: Container(
                            width: size.width * 0.45,
                            height: size.height * 0.25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.091, left: size.height * 0.02),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewLand()));
                          },
                          child: Commercial()
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.091,
                              left: size.height * 0.01),
                          child: Commercial()
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.1, left: size.width * .41),
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
                                color:
                                    isFave3 == 0 ? Colors.white : Colors.grey,
                                borderRadius: BorderRadius.circular(11)),
                            child: Center(
                                child: isFave3 == 1
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
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.1, left: size.width * .41),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (isFave2 == 0) {
                                  isFave2 = 1;
                                } else {
                                  isFave2 = 0;
                                }
                                print(isFave2);
                              });
                            },
                            child: Container(
                              width: size.width * 0.06,
                              height: size.height * 0.03,
                              decoration: BoxDecoration(
                                  color:
                                      isFave2 == 0 ? Colors.white : Colors.grey,
                                  borderRadius: BorderRadius.circular(11)),
                              child: Center(
                                  child: isFave2 == 1
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
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.27, left: size.height * 0.03),
                        child: Text(
                          "Woxro office",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.27, left: size.width * 0.25),
                        child: Text(
                          "Woxro office",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * .28, left: size.width * .34),
                        child: Text(
                          "Rs.2500/Hr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                              fontSize: 9),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * .28, left: size.width * .33),
                        child: Text(
                          "Rs.2500/Hr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                              fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.30,
                              left: size.height * 0.03),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Location1()));
                            },
                            child: Container(
                              width: size.width * 0.30,
                              height: size.height * 0.03,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  Text(
                                    "Thrissur",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.30, left: size.width * 0.17),
                          child: Container(
                            width: size.width * 0.30,
                            height: size.height * 0.03,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                Text(
                                  "Thrissur",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.height * 0.01, top: size.height * 00.37),
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      child: Text(
                        "Commercial Office",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * .8, top: size.height * 00.39),
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.05,
                      child: Text(
                        "see all",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.42, left: size.height * 0.02),
                        child: Container(
                          width: size.width * 0.45,
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.42, left: size.height * 0.01),
                        child: Container(
                          width: size.width * 0.45,
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.42, left: size.height * 0.02),
                        child: Commercial()
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.42, left: size.height * 0.01),
                        child: Commercial()
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.43, left: size.width * .41),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isFave1 == 0) {
                                isFave1 = 1;
                              } else {
                                isFave1 = 0;
                              }
                              print(isFave1);
                            });
                          },
                          child: Container(
                            width: size.width * 0.06,
                            height: size.height * 0.03,
                            decoration: BoxDecoration(
                                color:
                                    isFave1 == 0 ? Colors.white : Colors.grey,
                                borderRadius: BorderRadius.circular(11)),
                            child: Center(
                                child: isFave1 == 1
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.43, left: size.width * .41),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (isFave == 0) {
                                isFave = 1;
                              } else {
                                isFave = 0;
                              }
                              print(isFave);
                            });
                          },
                          child: Container(
                            width: size.width * 0.06,
                            height: size.height * 0.03,
                            decoration: BoxDecoration(
                                color: isFave == 0 ? Colors.white : Colors.grey,
                                borderRadius: BorderRadius.circular(11)),
                            child: Center(
                                child: isFave == 1
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
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.60, left: size.height * 0.03),
                        child: Text(
                          "Woxro office",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.60, left: size.width * 0.25),
                        child: Text(
                          "Woxro office",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * .61, left: size.width * .34),
                        child: Text(
                          "Rs.2500/Hr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                              fontSize: 9),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * .60, left: size.width * .33),
                        child: Text(
                          "Rs.2500/Hr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                              fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.63,
                              left: size.height * 0.03),
                          child: Container(
                            width: size.width * 0.30,
                            height: size.height * 0.03,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                Text(
                                  "Thrissur",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.63, left: size.width * 0.17),
                          child: Container(
                            width: size.width * 0.30,
                            height: size.height * 0.03,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                  size: 20,
                                ),
                                Text(
                                  "Thrissur",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
