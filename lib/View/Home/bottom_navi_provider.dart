import 'package:flutter/cupertino.dart';

class BottomNavigationProvider extends ChangeNotifier{
  int page = 0;

  void changePage(index){
    page = index;
    notifyListeners();
  }
}