
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ui_project/Screens/HomePage.dart';



class Location1 extends StatefulWidget {
   Location1({Key? key,required this.locationLat,required this.locationLng}) : super(key: key);

  var locationLat,locationLng;

  @override
  State<Location1> createState() => _Location1State();
}

class _Location1State extends State<Location1> {
  Location location = Location();
  LocationData? _locationData;

  Future<LocationData> GetLoct() async {
    _locationData = await location.getLocation();
    return _locationData!;
  }
  var city = "Cochin";
  var india1= "India";
  var City = TextEditingController();
  var india=TextEditingController();
  @override
  initState(){
    super.initState();
    City.text=city;
    india.text=india1;
  }
  Location lctn = Location();
  CameraPosition init = const CameraPosition(target: LatLng(11.258753, 75.780411), zoom: 15);

  cls() async {

    LocationData lctndata = await lctn.getLocation();
    print(lctndata.longitude);
    init = CameraPosition(
        target: LatLng(lctndata.latitude!, lctndata.longitude!),zoom: 15);
    print(init);
    mapController!.animateCamera(CameraUpdate.newCameraPosition(init));
  }


  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white60,
          leading: Icon(Icons.sort,color: Colors.indigo,size: 30),
          title: Text("Xentice",style: TextStyle(color: Colors.blue.shade700,fontSize: 28,),),
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey.shade200,
                height: 60,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: new CircularPercentIndicator(
                        radius: 25,
                        lineWidth: 12,
                        percent: 0.7,
                        center: new Text(
                          "3/4",
                          style:
                          new TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        circularStrokeCap: CircularStrokeCap.butt,
                        backgroundColor: Colors.white,
                        progressColor: Colors.blue.shade900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Container(
                        height : 39,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Location",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                            Text("Progress Details  >"),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width*.94,
                  child: TextField(
                    readOnly: true,
                    controller:india,
                    style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.grey.shade600,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade400,

                        border: OutlineInputBorder(
                          // borderSide: BorderSide(
                          //   width: 1, color: Colors.greenAccent,
                          // ),
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width*.94,
                  child: TextField(
                    controller: City,
                    style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1, color: Colors.greenAccent,
                            ),
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width*.94,
                  child: TextField(
                    controller: City,
                    style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: "Locality",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1, color: Colors.greenAccent,
                            ),
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width*.94,
                  child: TextField(
                    controller: City,
                    style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: "Street",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1, color: Colors.greenAccent,
                            ),
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Container(
                  width: size.width*.93,
                  height: size.height*.3,
                  child:GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    initialCameraPosition: CameraPosition(target:  LatLng(widget.locationLat,widget.locationLng), zoom: 15),

                  ),
                  // floatingActionButton:

                  ) ,

                ),
              //FloatingActionButton(onPressed: cls, child: Icon(Icons.add)),



            Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(bottom: size.height*.01,left: size.width*.03),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Uisample()));
                      },
                      child: Container(
                        width: size.width*.41,
                        height: size.height*.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: Colors.blue.shade900
                            )
                        ),
                        child: Center(child: Text("Back",style: TextStyle(color: Colors.blue.shade900,fontSize: 18,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: size.height*.01,left: size.width*.09),
                    child: Container(
                      width: size.width*.41,
                      height: size.height*.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.blue.shade900
                      ),
                      child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ],
              ),

            ],

          ),
        ),
      )
    );
  }
}