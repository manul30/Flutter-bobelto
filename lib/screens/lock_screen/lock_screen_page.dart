// import 'package:bobelto/screens/barra_swipe/barra_operaciones.dart';
import 'dart:math';
import 'package:bobelto/screens/barra_swipe/barra_operaciones.dart';
import 'package:bobelto/screens/lock_screen/components/info_card.dart';
import 'package:bobelto/screens/lock_screen/components/slider_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:bobelto/constant.dart';
import 'package:bobelto/widgets/scaffolds/base_scaffold.dart';
import 'components/title.dart';
import 'package:bobelto/screens/barra_swipe/components/mode_option.dart';
import 'package:bobelto/screens/lock_screen/components/temperature_slider.dart';
import 'package:bobelto/screens/lock_screen/components/rangeSlider.dart';
import 'package:bobelto/models/info.dart';
import 'package:camera/camera.dart';
import 'package:bobelto/screens/lock_screen/camera_page.dart';
import 'package:bobelto/widgets/pitch_yaw_roll.dart';
import 'package:roslib/roslib.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';




List<CameraDescription> cameras;
final PanelController _pc = new PanelController();

class LockScreen extends StatefulWidget {


  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  Ros ros;
  Topic chatter;
  Topic camera;
  
  var pitch = '';
  var yaw = '';
  var roll = '';
  var ang = 0.0;

  @override

  void initState() {              // AÑADIR TOPICOS ---------------------------------------------------------
    ros = Ros(url: 'ws://localhost:9090');    // CAMBIAR POR EL IP DEL RASPBERRY
    chatter = Topic(
        ros: ros, name: '/chatter', 
        type: "std_msgs/String", 
        reconnectOnClose: true, 
        queueLength: 10, 
        queueSize: 10
        );
    
    camera = Topic(
      ros: ros,
      name: '/raspicam_node/image/compressed',
      type: 'sensor_msgs/CompressedImage',
      queueSize: 10,
      queueLength: 10,
    );


    super.initState();
  }


  void initConnection() async {
    ros.connect();
    await chatter.subscribe();
    await camera.subscribe();
    setState(() {});
  }

  void destroyConnection() async {
    await chatter.unsubscribe();
    await camera.unsubscribe();
    ros.close();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarContent: [
            Expanded(
            child: HomeScreenTitle(
            upperTitle: "GIIT Robotics",
            title: "BOBELTO",
            ),
            ),
      ],  

      body: 
      
      SlidingUpPanel(
        controller: _pc,
        minHeight: 75.0,
        maxHeight: MediaQuery.of(context).size.height * 0.95,
        color: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 200.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //-------------------------------------------------------------------------------------------------
        Contenedor(MediaQuery.of(context).size.height*0.825,MediaQuery.of(context).size.width*0.265,[
          Text('STATUS',
            style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: mainTextColor,),),    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 20,),
              Expanded(child: TemperatureSlider(val: ang, min: 0, max: 100, unid: "mA", message: "Current")),
              SizedBox(width: 30,),
              Expanded(child: TemperatureSlider(val: ang, min: 0, max: 24, unid: " V", message: " Voltage")),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Motor 1 ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Motor 2 ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Motor 3 ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Motor 4 ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Motor 5 ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Motor 6 ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(width: 20,),
            Text('Gripper ('+pitch+'%):', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: mainTextColor,),),
            SizedBox(width: 20,),
            Expanded(child: RangeSliderLabelWidget(val: ang)),
              ],
          ),
           
            
          //SizedBox(height: 350,),
          //InformationCard(information[0]),
        ]),
         //-------------------------------------------------------------------------------------------------
        Contenedor(MediaQuery.of(context).size.height*0.825,MediaQuery.of(context).size.width*0.265*2,[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text('LIVE  ',
            style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: mainTextColor,),),
            
          Container(height: 20,width: 13, decoration: BoxDecoration( shape:BoxShape.circle, color: Colors.red.shade900),),
          
          ],),
          
          StreamBuilder<Object>(
          stream: ros.statusStream,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder(
                    stream: camera.subscription,                                    // Crear topico de camara
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      switch(snapshot.connectionState){
                        case ConnectionState.none:
                          return Column(children:[Text('POR FAVOR, ESTABLECER CONEXION AL MASTER',style: TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: mainTextColor,)),
                            ]);
                        case ConnectionState.waiting:
                          return Column(children:[Text('ESPERANDO DATOS DEL TOPICO DE CAMARA',style: TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: mainTextColor,)),
                            CircularProgressIndicator()]);
                        case ConnectionState.active:
                          change();
                          return getImagenBase64(snapshot.data['msg']['data']);
                      }
                      return Container();
                    },
                  ),

                  ActionChip(
                    label: Text(snapshot.data == Status.CONNECTED ? 'DISCONNECT' : 'CONNECT'),
                    backgroundColor: snapshot.data == Status.CONNECTED ? Colors.green[300] : Colors.grey[300],
                    onPressed: () {
                      //print(snapshot.data);
                      if (snapshot.data != Status.CONNECTED) {
                        this.initConnection();
                      } else {
                        this.destroyConnection();
                      }
                    },
                  ),
                  
                  StreamBuilder(
                    stream: chatter.subscription,                                  // Crear topico de camara
                    builder: (context, snapshot) {
                      switch(snapshot.connectionState){
                        case ConnectionState.none:
                          return SizedBox();
                        case ConnectionState.waiting:
                          return Column(children:[Text('ESPERANDO DATOS DEL TOPICO DE GIROSCOPIO',style: TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.w300,
            color: mainTextColor,)),
                            CircularProgressIndicator()]);
                        case ConnectionState.active:
                          change();
                          ang=double.parse(snapshot.data['msg']['data'].split(' ')[2]);
                          //print(ang);
                          //print(double.parse(snapshot.data['msg']['data'].split(' ')[2]));
                          //print(double.parse(snapshot.data['msg']['data'].split(' ')[2]).runtimeType);
                          pitch = snapshot.data['msg']['data'].split(' ')[2];
                          yaw = snapshot.data['msg']['data'].split(' ')[2];
                          roll = snapshot.data['msg']['data'].split(' ')[2];
                          return SizedBox();
                      }
                      return Container();

                    },
                  ),
                  
                ],
                

              ),
            );
          }),
          
          /*
          Image.asset(
                      'assets/images/imagen.png',
                      width: MediaQuery.of(context).size.width*0.5,
                      height: MediaQuery.of(context).size.height*0.5,
                    ),
          //RangeSliderLabelWidget(),
          Image.asset(
                      'assets/images/mando2.png',
                      width: MediaQuery.of(context).size.width*0.25,
                      height: MediaQuery.of(context).size.height*0.25,
                    ),
          */
          ]),

         //-------------------------------------------------------------------------------------------------
        Contenedor(MediaQuery.of(context).size.height*0.825,MediaQuery.of(context).size.width*0.15,[
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Text('PITCH '+pitch+'°',style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: mainTextColor,),),
          PRY(ang,/*double.parse(pitch)*/),
          
          Text('ROLL '+roll+'°',style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: mainTextColor,),),
          PRY(ang, /*double.parse(roll),*/),
          
          Text('YAW '+yaw+'°',style: TextStyle(fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: mainTextColor,),),
          PRY(ang,),
          
          ],)
        ]),
      ],
                
        ),
        ),
        ),
         panel: _operationBar(isOn: false)
            
      ),
    
    );
  }

  change() async{
    await Future.delayed(Duration(microseconds: 10));
    setState(() {});
  
  }

}

class _operationBar extends StatefulWidget {
  var isOn;

  _operationBar({
    Key key,
    this.isOn,
  }) : super(key: key);
  @override
  _operationBarState createState() => _operationBarState();

}


class _operationBarState extends State<_operationBar> {
    
  bool isOn;
  
  void initState() {
    this.isOn = widget.isOn ?? true;
    super.initState();
  }
  
  double proporcion=0.2;
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
            
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                boton_modo_1,boton_modo_2,boton_modo_3,boton_modo_4,
                boton_modo_5,boton_modo_6,boton_modo_7,boton_modo_8
                ],
              ),  
            SizedBox(height: 20.0),
            Container(
              width:1800,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              ///////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  FontText('On/Off'),FontText('Setup'),FontText('Nivel'),FontText('Manual'),
                ],
              ),
              ////////////////
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
              /////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  FontText('Auto'),FontText('Emergencia'),FontText('Minion'),FontText('Vision'),
                ],
              ),
              ////////////////////

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

class Contenedor extends StatelessWidget{
  final double height;
  final double width;
  final List <Widget> list; 
  const Contenedor(this.height, this.width, this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: width,
            height: height,
            // margin: EdgeInsets.only(left: 20,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50.0),
                bottomLeft:Radius.circular(50.0),
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
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                  topLeft: Radius.circular(50.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: conBackgroundColor,
                ),
              ),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list,
              ),),
            ),
          );   
  }
}

class FontText extends StatelessWidget{
  final text;
  const FontText(this.text);
  @override
  Widget build(BuildContext context){
    return Text(
          text,
          style: TextStyle(
            color: lightTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        );
  }
}



Widget getImagenBase64(String imagen) {
    var _imageBase64 = imagen;
    const Base64Codec base64 = Base64Codec();
    if (_imageBase64 == null) return new Container(child: Text('XD'),);
    var bytes = base64.decode(_imageBase64);
    return Image.memory(
          bytes,
          gaplessPlayback: true,
          width: 400,
          fit: BoxFit.fitWidth,
       
    );
  }
