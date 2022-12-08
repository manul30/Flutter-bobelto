import 'package:flutter/material.dart';

class CustomSliderTheme extends StatelessWidget {
  final Widget child;
  final Color color;

  const CustomSliderTheme({
    @required this.child,
    @required this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double thumbRadius = 5;
    const double tickMarkRadius = 5;

    //final activeColor = Color.fromRGBO(255, 0, 77, 1);
    final inactiveColor = Color.fromRGBO(109, 114, 120, 1);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 3,

        /// Thumb
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: thumbRadius,
          enabledThumbRadius: thumbRadius,
        ),

        /// Tick Mark
        rangeTickMarkShape:
            RoundRangeSliderTickMarkShape(tickMarkRadius: tickMarkRadius),

        /// Inactive
        inactiveTickMarkColor: inactiveColor,
        inactiveTrackColor: inactiveColor,

        /// Active
        thumbColor: color,
        activeTrackColor: color,
        activeTickMarkColor: color,
      ),
      child: child,
    );
  }
}