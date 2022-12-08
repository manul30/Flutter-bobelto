import 'package:flutter/material.dart';

final List<Color> conBackgroundColor = [
  Color(0xFF353A40),
  Color(0xFF16171B),
];
final List<Color> borderColors = [
  Color(0xFF424750),
  Color(0xFF202326),
];
final List<Color> progressBarBackground = [
  Color(0xFF202428),
  Color(0xFF131314),
];
final List<Color> progressBarColor = [
  Color(0xff11A8FD),
  Color(0xff005696),
];
final Color lightTextColor = Color(0xFF7F8489);
final Color mainTextColor = Color(0xFFFDFDFD);
final Color darkColor = Color(0xFF17181C);
final Color progressShadowColor = Color(0xFF141415);
final Color progressShadowColor2 = Color(0xFF485057);
final Color progressBarTrackColor = Color(0xff1F2124);

final List<String> review = [
  "Para poder apagar el robot, este debe encontrarse fuera del agua. Pueden ir apagándose sensores y actuadores que no sean importantes (de grippers, luz, servo, ultrasonido, etc). Una vez fuera, debe avisar que está listo para apagarse.",
  "Se hace una prueba de sensores y actuadores del sistema. Se verificará, el giro de los motores y su respectivo control, el funcionamiento de los sensores, que no se encuentren fallos en los componentes o en sus conexiones. En caso haya algún fallo, avisar a la computadora de la superficie sobre donde se encuentra el error. Una vez termine la prueba, el robot esperará ordenes para su siguiente modo.",
  "Modo para manipular la posición vertical del robot. Este solo funcionará con los respectivos motores para el movimiento en este eje, el sensor de presión externa e interna para verificar que no se sobrepasen límites de profundidad y el giroscopio acelerómetro para verificar la distancia. El dato que se entregará desde la zona de control será un dato numérico. Gracias al control, se deberá mantener en esa posición.",
  "Este modo utilizará un Joystick para controlar el movimiento del mismo. Tiene las mismas condiciones que el modo autónomo, solo que este no necesitará un control. De igual manera deberá mantenerse en la misma profundidad siempre.",
  "Modo para el movimiento horizontal del robot. Consiste en el sistema con su respectivo control para posicionar al robot en base a las coordenadas introducidas por el piloto desde la superficie. Se debe mantener en la misma profundidad siempre, por lo que todos los motores estarán activos, al igual que los sensores.",
  "Este modo se activa automáticamente en caso haya algún fallo en el sistema mientras se encuentre bajo el agua. Este actuará de la siguiente manera: en caso el fallo sea de motores, cortar su respectiva alimentación al mismo y avisar a la computadora para su debida extracción, caso contrario, activar SOLO los motores necesarios para que salga a la superficie y debe desactivar cualquier otro sensor o actuador.",
  "Modo para controlar al mini-rov. 'Bobelto' se deberá mantener en su misma posición todo el momento. Sus sensores no serán necesarios para ese entonces, solo los que se encuentren en el mini-rov (cámara y sensor de corriente, otros aún no están definidos). 'Mini-Bobelto' será controlado de manera manual. Este debe volver a su posición inicial para poder finalizar el modo.",
  "En este modo, lo que más importa es el procesamiento de imágenes. El robot deberá mantenerse en su posición actual, los sensores y actuadores (que no sean los propulsores) deberán estar apagados, las capacidades de las computadoras deben ser utilizadas solo por el procesamiento de imágenes y computer vision.",
];