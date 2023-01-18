import 'package:flutter/material.dart';

class WriteAccountController extends ChangeNotifier{
  int tab = 0;
  List<String> tabItemName = ['지출','고정지출','수입','예산'];

  void changeTab(index){
    tab = index;
    notifyListeners();
  }
}