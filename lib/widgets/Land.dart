import 'package:flutter/material.dart';

class Land extends StatefulWidget {
   Land({Key? key}) : super(key: key);

  @override
  State<Land> createState() => _LandState();
}

class _LandState extends State<Land> {
  int isFave = 0;

  int isFave1 = 0;

  int isFave2 = 0;

  int isFave3 = 0;

  int isFave4 = 0;

  var selected_index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (context, index) => SizedBox(width: size.width*.05,),
        itemBuilder: (context, index) {
          print(index);
          return InkWell(
            onTap: () {
              setState(() {
                selected_index = index;
              });
            },
            child: Container(
                width: size.width * 0.21,
                height: size.height*.1,
                decoration: BoxDecoration(
                  color: selected_index == index
                      ? Colors.blue.shade900
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.01,
                        left: size.width * 0.050,
                      ),
                      child: Image.asset(
                        "asset/aaa.png",
                        height: size.height * 0.060,
                        color: selected_index == index
                            ? Colors.white
                            : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.06,
                        left: size.height * 0.015,
                      ),
                      child: Text(
                        '''Industrial''',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: selected_index == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.076,
                        left: size.height * 0.031,
                      ),
                      child: Text(
                        '''Land''',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: selected_index == index
                                ? Colors.white
                                : Colors.grey),
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
