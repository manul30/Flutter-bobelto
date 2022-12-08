import 'package:flutter/material.dart';
import 'package:bobelto/constant.dart';
import 'package:bobelto/widgets/buttons/toggle_button.dart';

class ModeOption extends StatelessWidget {
  final String name;
  final Widget icon;

  const ModeOption({Key key, this.name, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align( alignment: Alignment(0,100),
        child: Text(
          name,
          style: TextStyle(
            color: lightTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          margin: EdgeInsets.only(top: 5.0),
          child: Stack(
            //overflow: Overflow.visible,
            children: [
              Positioned(
                top: -30.0,
                right: -30.0,
                left: -30.0,
                bottom: -30.0,
                child: ToggleButton(
                  child: this.icon,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
