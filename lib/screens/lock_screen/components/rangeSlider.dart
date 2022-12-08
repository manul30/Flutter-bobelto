import 'package:flutter/material.dart';
import 'package:bobelto/screens/lock_screen/range_slider_example.dart';
import 'package:bobelto/constant.dart';
class RangeSliderLabelWidget extends StatefulWidget {
  final double val;
  
  RangeSliderLabelWidget({@required this.val, Key key}) : super(key: key);

  @override
  _RangeSliderLabelWidgetState createState() => _RangeSliderLabelWidgetState();
}

class _RangeSliderLabelWidgetState extends State<RangeSliderLabelWidget> {
  var active = Color.fromRGBO(255, 0, 77, 1);
  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderThemeData(
          /// ticks in between
          activeTickMarkColor: active,
          inactiveTickMarkColor: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSliderSideLabel(),
            //const SizedBox(height: 16),
            //buildSliderTopLabel(),
          ],
        ),
      );

  Widget buildSliderSideLabel() {
    final double min = 0;
    final double max = 100;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildSideLabel(min),
          Expanded(
            child: 
            CustomSliderTheme(child: 
            RangeSlider(
              values: (widget.val > 100) 
              ? RangeValues(50, 100) 
              :(widget.val>=50) 
              ? RangeValues(50,widget.val) 
              : (widget.val<0)
              ? RangeValues(0,50)
              : RangeValues(widget.val,50),
              min: min,
              max: max,
              divisions: 100,
              labels: RangeLabels("0","100"),
              onChanged: (values) => setState(() => {}),
            ),
            color: (widget.val<50)
            ?Color.fromRGBO(255, 0, 77, 1)
            : Color.fromARGB(255, 9, 99, 233),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }

  Widget buildLabel({
    @required String label,
    @required Color color,
  }) =>
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ).copyWith(color: color),
      );

  Widget buildSideLabel(double value) => Container(
        width: 28,
        child: Text(
          value.round().toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300,color: mainTextColor,),
          textAlign: TextAlign.end,
        ),
      );
}