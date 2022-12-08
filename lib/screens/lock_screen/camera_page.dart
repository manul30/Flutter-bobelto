

import 'package:bobelto/widgets/scaffolds/base_scaffold.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bobelto/constant.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({this.cameras, Key key}): super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}


class _CameraPageState extends State<CameraPage>{
  CameraController controller;
  XFile pictureFile;

  @override
  void initState(){
      super.initState();
      controller = CameraController(
        widget.cameras[0],
        ResolutionPreset.max,
      );
      controller.initialize().then((_) {
        if (!mounted){
          return;
        }
        setState(() {});
      });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    if(!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return BaseScaffold(
      body: Row(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 700,
              width: 1300,
              child: CameraPreview(controller),
            ),
          ),
        ),
        Contenedor(MediaQuery.of(context).size.height*0.9,MediaQuery.of(context).size.width*0.15,[
        ]),
    /*
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async{
            pictureFile = await controller.takePicture();
            setState(() {});
          },
          child: const Text('Capture Image'),
          ),
        ),*//*
        if (pictureFile != null)
        Image.network(
          pictureFile.path,
          height: 200,
        )*/
        ],),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list,
              ),
            ),
          );   
  }
}
