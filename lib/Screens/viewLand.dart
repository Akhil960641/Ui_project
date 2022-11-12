
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ViewLand extends StatefulWidget {
  const ViewLand({Key? key}) : super(key: key);

  @override
  State<ViewLand> createState() => _ViewLandState();
}

class _ViewLandState extends State<ViewLand> {

  var prop ="Woxro office";
  var price = "2500";
  var seat = "100";
  var hr="/Hr";
  var prop1 = TextEditingController();
  var price1 = TextEditingController();
  var seat1 = TextEditingController();
  var hr1 = TextEditingController();
  @override
  initState(){
    super.initState();
    prop1.text=prop;
    price1.text=price;
    seat1.text=seat;
    hr1.text=hr;
  }
  var selected_index ;
  var selectedindex1;
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white60,
          leading:Icon(Icons.sort,color: Colors.indigo,size: 20),
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
                height: size.height*.1,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child: new CircularPercentIndicator(
                        radius: 25,
                        lineWidth: 12,
                        percent: 0.2,
                        center: new Text(
                          "1/4",
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
                            Text("Property",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                            Text("Progress Details  >"),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // height: size.height*.27,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        childAspectRatio:1/1
                    ),
                    itemBuilder: (context,index) {
                      return Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              selected_index=index;
                              selectedindex1 =0;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color:selected_index==index? Colors.blue.shade900:null,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(bottom:size.height*0.01,left: size.width*0.050,),
                                    child: Image.asset("asset/aaa.png",height: size.height*0.060,color:selected_index==index? Colors.white:null,),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top:size.height*0.06,left: size.height*0.015,),
                                    child: Text('''Industrial''',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:selected_index==index? Colors.white:Colors.grey),),
                                  ),Padding(
                                    padding:  EdgeInsets.only(top:size.height*0.076,left: size.height*0.031,),
                                    child: Text('''Land''',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:selected_index==index? Colors.white:Colors.grey),),
                                  ),
                                ],
                              )
                          ),
                        ),
                      );
                    }
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*.36,top: size.height*0.01,),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      selectedindex1 =1;
                      selected_index =8;
                    });
                  },
                  child: Container(
                      width: size.width*0.21,
                      height: size.height*0.11,
                      decoration: BoxDecoration(
                        color:selectedindex1==1? Colors.blue.shade900:null,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(bottom:size.height*0.01,left: size.width*0.050,),
                            child: Image.asset("asset/aaa.png",height: size.height*0.060,color:selectedindex1==1? Colors.white:null,),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:size.height*0.06,left: size.height*0.015,),
                            child: Text('''Industrial''',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:selectedindex1==1? Colors.white:Colors.grey),),
                          ),Padding(
                            padding:  EdgeInsets.only(top:size.height*0.076,left: size.height*0.031,),
                            child: Text('''Land''',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color:selectedindex1==1? Colors.white:Colors.grey),),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextField(
                  controller: prop1,
                  style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      labelText: "Property Title",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, color: Colors.greenAccent,
                          ),
                          borderRadius: BorderRadius.circular(7)
                      )
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text("Transaction Type",style: TextStyle(color: Colors.grey),),
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _value,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.blue.shade900),
                          onChanged: (value){
                            setState((){
                              _value=1;
                            });
                          }
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: size.width*.1,top: size.height*.025),
                        child: Text("Sell",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.blue.shade900),
                          onChanged: (value){
                            setState((){
                              _value=2;
                            });
                          }
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: size.width*.1,top: size.height*.025),
                        child: Text("Rent",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Radio(
                          value: 3,
                          groupValue: _value,
                          fillColor:
                          MaterialStateColor.resolveWith((states) => Colors.blue.shade900),
                          onChanged: (value){
                            setState((){
                              _value= 3;
                            });
                          }
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: size.width*.1,top: size.height*.025),
                        child: Text("Lease",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width*.6,
                      child: TextField(
                        controller: price1,
                        style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: "Price",
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
                      width: size.width*.3,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: hr1,
                        style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold,),
                        decoration: InputDecoration(
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

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width*.6,
                      child: TextField(
                        controller: price1,
                        style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: "Build Area",
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
                      width: size.width*.3,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: hr1,
                        style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold,),
                        decoration: InputDecoration(
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

                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width*.6,
                      child: TextField(
                        controller: price1,
                        style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            labelText: "Plot Area",
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
                      width: size.width*.3,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: hr1,
                        style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold,),
                        decoration: InputDecoration(
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

                ],
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(
                  width: size.width*.94,
                  child: TextField(
                    controller: seat1,
                    style: TextStyle(fontSize: 13, height:size.height*.001, color: Colors.black,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        labelText: "Seating Capacity",
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






            ],
          ),
        ),
      ),
    );
  }
}