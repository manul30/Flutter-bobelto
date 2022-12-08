import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_math/vector_math.dart';
import 'dart:math';
import 'package:bobelto/constant.dart';


class PYR extends StatefulWidget {

  final double rotationAngle;
  const PYR ({ Key key, this.rotationAngle }): super(key: key);

  @override
  _PYRState createState() => _PYRState();
}

class _PYRState extends State<PYR>{
  double rotationAngle=0;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print(rotationAngle);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 135,
                  width: 135,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: conBackgroundColor,
                    
                    ),
                  ),
                  child: Stack(
                    children: [
                    Transform.rotate(
                    angle: radians(rotationAngle),
                    child: Image.asset("assets/images/piy.png"),
                    ),
                    Image.asset(
                      'assets/images/indicators.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                    ],
                  ),
    );
  }
}


class PRY extends StatelessWidget{
  final double angle;
  PRY(this.angle);

  @override
  Widget build(BuildContext context) {
    return Container(

                  height: 135,
                  width: 135,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: conBackgroundColor,
                    
                    ),
                  ),
                  child: Stack(
                    children: [
                    Transform.rotate(
                    angle: angle*3.1416/180,
                    child: Image.asset("assets/images/piy.png"),
                    ),
                    Image.asset(
                      'assets/images/indicators.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                    ],
                  ),
    );;
  }

}
