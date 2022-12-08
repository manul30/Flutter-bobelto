/*
import 'package:bobelto/screens/barra_swipe/components/mode_option.dart';
import 'package:flutter/material.dart';
import 'package:bobelto/constant.dart';

import './components/operation_mode.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_hero/local_hero.dart';

class operationBar extends StatefulWidget {
  var isOn;

  operationBar({
    Key key,
    this.isOn,
  }) : super(key: key);
  @override
  _operationBarState createState() => _operationBarState();

}


// ignore: camel_case_types
class _operationBarState extends State<operationBar> {
  bool isOn;
  @override
  void initState() {
    this.isOn = widget.isOn ?? true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  double proporcion=0.15;
  AlignmentGeometry alignment = Alignment.topLeft;

  ModeOption boton_modo_1= ModeOption(name: "On/Off",icon: SvgPicture.asset("assets/svgs/power.svg"),);
  ModeOption boton_modo_2= ModeOption(name: "Setup",icon: SvgPicture.asset("assets/svgs/tool.svg"),);
  ModeOption boton_modo_3= ModeOption(name: "Nivel",icon: SvgPicture.asset("assets/svgs/sliders.svg"),);
  ModeOption boton_modo_4= ModeOption(name: "Manual",icon: SvgPicture.asset("assets/svgs/gamepad.svg"),);
  ModeOption boton_modo_5= ModeOption(name: "Auto",icon: Text("A",style:TextStyle(color:mainTextColor,fontWeight:FontWeight.w800,fontSize:20.0,),),);
  ModeOption boton_modo_6= ModeOption(name: "Emergencia",icon: SvgPicture.asset("assets/svgs/emergency.svg"),);
  ModeOption boton_modo_7= ModeOption(name: "Minion",icon: SvgPicture.asset("assets/svgs/minion.svg"),);
  ModeOption boton_modo_8= ModeOption(name: "Vision",icon: SvgPicture.asset("assets/svgs/eye.svg"),);

  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(left: 50,right: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: borderColors,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(2.0),
        padding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0),
            topLeft: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: conBackgroundColor,
          ),
        ),
        child: Column(
          children: [
            Container( //config de la barrita negra
              width: 50.0, 
              height: 4.0, 
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
            LocalHero(tag: 'b1', child: Align(alignment: this.isOn==true? Alignment.topRight:Alignment.topLeft,child: boton_modo_1)),
            
            // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              //children: [
                //boton_modo_1,boton_modo_2,boton_modo_3,boton_modo_4,
                //boton_modo_5,boton_modo_6,boton_modo_7,boton_modo_8
                //],
              //),
            
            SizedBox(height: 10.0),
            Container(
              width:1800,
              height: 670,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  boton_modo_1,boton_modo_2,boton_modo_3,boton_modo_4,
                ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: <Widget>[
                Description(review[0], proporcion),
                Description(review[1], proporcion),
                Description(review[2], proporcion),
                Description(review[3], proporcion),
              ],
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  boton_modo_5,boton_modo_6,boton_modo_7,boton_modo_8,
                ],
              ),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.start,  
                children: <Widget>[
                  Description(review[4], proporcion),
                  Description(review[5], proporcion),
                  Description(review[6], proporcion),
                  Description(review[7], proporcion),
                  ],
                ),
                ]
              ),
            ),
            
            ],
          ),
        ),
      );
    }
  }
}

class Description extends StatelessWidget {
  final String data;
  final double proportion;
  const Description(this.data, this.proportion);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*proportion,
      child:Text(
        data,
        style: TextStyle(
          color: lightTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.0),
        textAlign: TextAlign.justify,),
    );
  }
}

*/
