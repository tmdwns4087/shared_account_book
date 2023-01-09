import 'package:flutter/material.dart';

class CalendarModel extends ChangeNotifier{
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();

  void selectDay(select, focus){
    // print('selectedDay : $selectedDay');
    // print('focusedDay : $focusedDay');
    // this.focusedDay = focusedDay;
    selectedDay = select;
    notifyListeners();
    print(selectedDay);
  }
}