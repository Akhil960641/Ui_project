import 'package:flutter/material.dart';

class Commercial extends StatelessWidget {
  const Commercial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      height: size.height * 0.17,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('asset/bbb.jpg'),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
