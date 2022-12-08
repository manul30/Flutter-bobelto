import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bobelto/screens/barra_swipe/components/mode_option.dart';

import '../../../constant.dart';

class ModePanel extends StatelessWidget {
  const ModePanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num=10;
    int num2=12;
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*Text(
          "Mode",
          style: TextStyle(
            color: mainTextColor,
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
          ),
        ),*/
        //SizedBox(height: 2.0),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex:num),
            ModeOption(
              name: "On/Off",
               icon: SvgPicture.asset("assets/svgs/power.svg"),
               ),
               Spacer(flex:num2),
            ModeOption(
              name: "Setup",
               icon: SvgPicture.asset("assets/svgs/tool.svg"),
               ),
               Spacer(flex:num2),
            ModeOption(
              name: "Nivel",
              icon: SvgPicture.asset("assets/svgs/sliders.svg"),
              ),
              Spacer(flex:num2),
            ModeOption(
              name: "Manual",
              icon: SvgPicture.asset("assets/svgs/gamepad.svg"),
              ),
              Spacer(flex:num2),
            ModeOption(
              name: "Auto",
              icon: Text(
                "A",
                style: TextStyle(
                  color: mainTextColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
              ),
            ),
            Spacer(flex:num),
            ModeOption(
              name: "Emergencia",
              icon: SvgPicture.asset("assets/svgs/emergency.svg"),
            ),
            Spacer(flex:num),
            ModeOption(
              name: "Minion",
              icon: SvgPicture.asset("assets/svgs/minion.svg"),
            ),
            Spacer(flex:num),
            ModeOption(
              name: "Visualización",
              icon: SvgPicture.asset("assets/svgs/eye.svg"),
            ),
            Spacer(flex:num)
          ],
        ),
      ],
    );
  }
}
