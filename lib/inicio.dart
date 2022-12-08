import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:bobelto/constant.dart';
import 'package:bobelto/widgets/scaffolds/base_scaffold.dart';
import 'title.dart';
class LockScreen extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: conBackgroundColor,
            ),
        ),
      ) 
    );

  }
}
