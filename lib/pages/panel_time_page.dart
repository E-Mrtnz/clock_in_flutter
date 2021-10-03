import 'package:flutter/material.dart';

// import 'dart:math' as math;

import 'package:provider/provider.dart';

import 'package:countdown_app/providers/countdown_provider.dart';

class PanelTimePage extends StatelessWidget {
  const PanelTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style1 = const TextStyle(
      fontSize: 20.0,
      color: Color(0xFF4bdfe6),
      fontWeight: FontWeight.w500,
    );
    TextStyle style2 = const TextStyle(
      fontSize: 80.0,
      color: Color(0xFF4bdfe6),
      fontWeight: FontWeight.w500,
    );
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFF00092E),
      child: Consumer<Countdown>(
        builder: (_, value, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.getWeekDay,
                style: style2,
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ContainerTime(
                    aguja: value.agujaH,
                    timetText: value.timeH,
                    textHMS: '\nHORA',
                    dots: 12,
                  ),
                  _ContainerTime(
                    aguja: value.agujaM,
                    timetText: value.timeM,
                    textHMS: '\nMINUTOS',
                    dots: 60,
                  ),
                  _ContainerTime(
                    aguja: value.agujaS,
                    timetText: value.timeS,
                    textHMS: '\nSEGUNDOS',
                    dots: 60,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(value.dayPeriod, style: style1),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${value.getDay} - ', style: style1),
                  Text(value.getMonth, style: style1),
                  Text(' - ${value.getYear}', style: style1),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

class _ContainerTime extends StatelessWidget {
  _ContainerTime({
    required this.aguja,
    required this.timetText,
    required this.textHMS,
    required this.dots,
  });

  final double aguja;
  final int dots;
  final int timetText;
  final String textHMS;

  TextStyle style = const TextStyle(
    fontSize: 60.0,
    color: Color(0xFF4bdfe6),
    fontWeight: FontWeight.w100,
  );
  TextStyle style2 = const TextStyle(
    fontSize: 30.0,
    color: Color(0xFF4bdfe6),
    fontWeight: FontWeight.w100,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150.0,
          height: 150.0,
          child: CustomPaint(
            painter: _CircleTime(
              aguja,
              dots: dots,
            ),
            child: Center(
              child: Text(
                (timetText < 10) ? '0$timetText' : '$timetText',
                style: style,
              ),
            ),
          ),
        ),
        Text(textHMS, style: style2)
      ],
    );
  }
}

class _CircleTime extends CustomPainter {
  _CircleTime(
    this.aguja, {
    required this.dots,
  });
  final double aguja;
  final int dots;

  @override
  void paint(Canvas canvas, Size size) {
    double wMax = size.width;
    double hMax = size.height;

    final Paint paint = Paint()
      ..color = const Color(0xFF4bdfe6)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    final Paint paint2 = Paint()
      ..color = const Color(0xFF4bdfe6).withOpacity(0.3)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;

    final c = Offset(wMax / 2, hMax / 2);

    final Rect rect = Rect.fromCenter(center: c, height: hMax, width: wMax);
    // DIBUJANDO FONDO DEL RELOJ
    double startAngle = -1.5708;
    double sweepAngle = 0.0;

    if (dots < 60) {
      // Los puntos para las horas
      for (var i = 0; i < 12; i++) {
        canvas.drawArc(
          rect,
          startAngle + sweepAngle,
          0.0261799, //1.5° de ancho
          // -1.6154 + value,
          // 0.00872665, //0.5° de ancho
          // 0.0174533, //1.0° de ancho
          // 0.0261799, //1.5° de ancho
          // 0.0349066, //2° de ancho
          // 0.0523599, //3° de ancho
          // 0.0610865, //3.5° de ancho
          // 0.0698132, //4° de ancho
          // 0.0523599, //5° de ancho
          // 0.10472, //6° de ancho
          // 0.139626, //8° de ancho
          false,
          paint2,
        );
        sweepAngle += 0.523599;
      }
    }
    if (dots > 12) {
      // Los puntos para los minutos y segundos
      for (var i = 0; i < 60; i++) {
        canvas.drawArc(
          rect,
          startAngle + sweepAngle,
          0.0261799, //1.5° de ancho
          false,
          paint2,
        );
        sweepAngle += 0.10472;
      }
    }
    // DIBUJANDO MANECILLAS DEL RELOJ
    canvas.drawArc(
      rect,
      -1.5708 + aguja,
      0.0261799, //1.5° de ancho
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
