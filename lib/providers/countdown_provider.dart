import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class Countdown extends ChangeNotifier {
  final _amPM = TimeOfDay.now().period == DayPeriod.am ? 'AM' : 'PM';

  DateTime _time = DateTime.now();
  double _gradosH = 0.0, _gradosM = 0.0, _gradosS = 0.0;
  int _format12Hrs = 0; // ignore: unused_field
  late String _weekDay, _month; // ignore: unused_field

  // double _grados = 0.0; // ignore: unused_field
  // double _getAgujasHMS({
  //   required int getTimeHMS,
  //   required int dateTimeHMS,
  //   required int grados,
  //   required int compareTime,
  // }) {
  //   Timer.periodic(
  //     const Duration(seconds: 1),
  //     (timer) {
  //       if (getTimeHMS != getTimeHMS) {
  //         // getTimeHMS = getTimeHMS;
  //         // getTimeHMS = DateTime.now();
  //         var a = DateTime.now();

  //         getTimeHMS = a.second;
  //         notifyListeners();
  //       }
  //     },
  //   );
  //   return _grados = (getTimeHMS.second * grados) * (3.141592 / 180);
  // }

  // double get pruebaAgujaS {
  //   return _getAgujasHMS(
  //     getTimeHMS: DateTime.now().second,
  //     dateTimeHMS: _time.second,
  //     // compareTime: DateTime.now().second,
  //     grados: 6,
  //   );
  // }

  // double get agujaH => _getAgujasHMS(
  //       compareTime: DateTime.now().hour,
  //       dateTimeHMS: DateTime.now().hour,
  //       getTimeHMS: _time.hour,
  //       grados: 30,
  //     );

  // double get agujaM => _getAgujasHMS(
  //       compareTime: DateTime.now().minute,
  //       dateTimeHMS: DateTime.now().minute,
  //       getTimeHMS: _time.minute,
  //       grados: 6,
  //     );
  // double get aguja2S => _getAgujasHMS(
  //       compareTime: DateTime.now().second,
  //       dateTimeHMS: DateTime.now().second,
  //       getTimeHMS: _time.second,
  //       grados: 6,
  //     );
  double get agujaH {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_time.hour != _time.hour) {
          _time = DateTime.now();
          notifyListeners();
        }
      },
    );
    _gradosH = (_time.hour * 30) * (3.141592 / 180);
    return _gradosH;
  }

  double get agujaM {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_time.second != DateTime.now().minute) {
          _time = DateTime.now();
          notifyListeners();
        }
      },
    );
    _gradosM = (_time.minute * 6) * (3.141592 / 180);
    return _gradosM;
  }

  double get agujaS {
    Timer.periodic(
      const Duration(seconds: 0),
      (timer) {
        if (_time.second != DateTime.now().second) {
          _time = DateTime.now();
          notifyListeners();
        }
      },
    );
    _gradosS = (_time.second * 6) * (3.141592 / 180);
    return _gradosS;
  }

  int _formato12H() {
    switch (_time.hour) {
      case 13:
        return _format12Hrs = 1;
      case 14:
        return _format12Hrs = 2;
      case 15:
        return _format12Hrs = 3;
      case 16:
        return _format12Hrs = 4;
      case 17:
        return _format12Hrs = 5;
      case 18:
        return _format12Hrs = 6;
      case 19:
        return _format12Hrs = 7;
      case 20:
        return _format12Hrs = 8;
      case 21:
        return _format12Hrs = 9;
      case 22:
        return _format12Hrs = 10;
      case 23:
        return _format12Hrs = 11;
      default:
        return 0;
    }
  }

  String _weekDays() {
    switch (_time.weekday) {
      case 1:
        return _weekDay = 'Lunes';
      case 2:
        return _weekDay = 'Martes';
      case 3:
        return _weekDay = 'Miercoles';
      case 4:
        return _weekDay = 'Jueves';
      case 5:
        return _weekDay = 'Viernes';
      case 6:
        return _weekDay = 'Sabado';
      case 7:
        return _weekDay = 'Domingo';
      default:
        return 'No existe';
    }
  }

  String _mounts() {
    switch (_time.month) {
      case 1:
        return _month = 'Enero';
      case 2:
        return _month = 'Febrero';
      case 3:
        return _month = 'Marzo';
      case 4:
        return _month = 'Abril';
      case 5:
        return _month = 'Mayo';
      case 6:
        return _month = 'Junio';
      case 7:
        return _month = 'Julio';
      case 8:
        return _month = 'Agosto';
      case 9:
        return _month = 'Septiembre';
      case 10:
        return _month = 'Octubre';
      case 11:
        return _month = 'Noviembre';
      case 12:
        return _month = 'Diciembre';
      default:
        return 'No existe';
    }
  }

  int get getDay => _time.day;
  String get getWeekDay => _weekDays();
  String get getMonth => _mounts();
  int get getYear => _time.year;
  int get timeH => _formato12H();
  int get timeM => _time.minute;
  int get timeS => _time.second;
  String get dayPeriod => _amPM;
}
