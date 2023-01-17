import 'package:flutter/material.dart';

class CalendarController extends ChangeNotifier{
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
  void changePage(date){
    focusedDay = DateTime(date.year,date.month,1);
    // selectedDay = DateTime(date.year,date.month,1);
    notifyListeners();
  }
  void selectDate(date){

  }
}