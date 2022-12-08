import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../constant.dart';
/*
class TemperatureSlider extends StatefulWidget {
  const TemperatureSlider({
    Key key,
  }) : super(key: key);

  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(10.0, 10.0),
              color: progressShadowColor,
              blurRadius: 70.0,
            ),
            BoxShadow(
              offset: Offset(-10.0, -10.0),
              color: progressShadowColor2,
              blurRadius: 70.0,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: progressBarBackground,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(360.0),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            startAngle: 90.0,
            size: 180.0,
            customColors: CustomSliderColors(
              progressBarColors: progressBarColor,
              gradientStartAngle: 180.0,
              gradientEndAngle: 360.0,
              trackColor: progressBarTrackColor,
              dotColor: progressBarTrackColor,
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 20.0,
              progressBarWidth: 20.0,
              shadowWidth: 20.0,
            ),
            spinnerMode: false,
            angleRange: 360.0,
          ),
          min: 0.0,
          max: 1000.0,
          initialValue: 24.0,
          onChange: (double value) {},
          onChangeStart: (double startValue) {},
          onChangeEnd: (double endValue) {},
          innerWidget: (double value) {
            return Center(
              child: Container(
                width: 60.0,
                height: 50.0,
                child: Column(
                  children: [
                    Text(
                      value.toInt().toString() + "°C",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: mainTextColor,
                      ),
                    ),
                    Text(
                      "Cooling...",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/
// STATELESS WIDGET -----------------------------------------
/*
class TemperatureSlider extends StatelessWidget {
  final double val;
  
  TemperatureSlider({
    this.val
  });

 @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(10.0, 10.0),
              color: progressShadowColor,
              blurRadius: 70.0,
            ),
            BoxShadow(
              offset: Offset(-10.0, -10.0),
              color: progressShadowColor2,
              blurRadius: 70.0,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: progressBarBackground,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(360.0),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
            startAngle: 90.0,
            size: 180.0,
            customColors: CustomSliderColors(
              progressBarColors: progressBarColor,
              gradientStartAngle: 180.0,
              gradientEndAngle: 360.0,
              trackColor: progressBarTrackColor,
              dotColor: progressBarTrackColor,
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 20.0,
              progressBarWidth: 20.0,
              shadowWidth: 20.0,
            ),
            spinnerMode: false,
            angleRange: 360.0,
          ),
          min: 0.0,
          max: 1000.0,
          initialValue: val,
          onChange: (double value) {},
          onChangeStart: (double startValue) {},
          onChangeEnd: (double endValue) {},
          innerWidget: (double value) {
            return Center(
              child: Container(
                width: 60.0,
                height: 50.0,
                child: Column(
                  children: [
                    Text(
                      value.toInt().toString() + "°C",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        color: mainTextColor,
                      ),
                    ),
                    Text(
                      "Cooling...",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/

// STATEFUL WIDGET --------------------------------------
class TemperatureSlider extends StatefulWidget {
  final double val;
  final double min;
  final double max;
  final String unid;
  final String message;
  TemperatureSlider({@required this.val, @required this.min, @required this.max, @required this.unid, @required this.message,Key key}) : super(key: key);

  @override
  _TemperatureSliderState createState() => _TemperatureSliderState();
}

class _TemperatureSliderState extends State<TemperatureSlider> {
  //_TemperatureSliderState();
  double valor = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(10.0, 10.0),
              color: progressShadowColor,
              blurRadius: 70.0,
            ),
            BoxShadow(
              offset: Offset(-10.0, -10.0),
              color: progressShadowColor2,
              blurRadius: 70.0,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: progressBarBackground,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
        ),
        padding: EdgeInsets.all(10.0),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            SleekCircularSlider(
          appearance: CircularSliderAppearance(
            counterClockwise: false,
            startAngle: 90.0,
            size: 120.0,
            customColors: CustomSliderColors(
              progressBarColors: progressBarColor,
              gradientStartAngle: 180.0,
              gradientEndAngle: 360.0,
              trackColor: progressBarTrackColor,
              dotColor: progressBarTrackColor,
            ),
            customWidths: CustomSliderWidths(
              trackWidth: 20.0,
              progressBarWidth: 20.0,
              shadowWidth: 20.0,
            ),
            spinnerMode: false,
            angleRange: 360.0,
          ),
          
          min: widget.min,
          max: widget.max,
          initialValue: (widget.val>= widget.max) ? widget.max : widget.val,
          /*
          onChange: (double value) {
            print('valor: $valor');
            print('widget.valor: ${widget.val}');
           setState(() {
            if (widget.val>widget.max){
              valor = widget.max;
              
            }else{
            valor = widget.val;
            }
          });},
          */
          onChangeStart: (double startValue) {},
          onChangeEnd: (double endValue) {},
          innerWidget: (double value) {
            return Center(
              child: Container(
                width: 60.0,
                height: 50.0,
                child: Column(
                  children: [
                    Text(
                      value.toInt().toString() + widget.unid,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w800,
                        color: mainTextColor,
                      ),
                    ),
                    Text(
                      widget.message,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        

          ],
        )
        
      ),
    );
  }
}