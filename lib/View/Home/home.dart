import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_account_book/View/Calendar/calendar_view.dart';
import 'package:shared_account_book/View/Wallet/wallet_view.dart';
import 'package:shared_account_book/View/more.dart';
import 'package:shared_account_book/View/statistics.dart';
import 'package:shared_account_book/View/Home/bottom_navi_provider.dart';
import 'package:shared_account_book/config.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late BottomNavigationProvider bottomNavigationProvider;
  @override
  Widget build(BuildContext context) {
    bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: content(),
        ),
        bottomNavigationBar : bottomNavigation()
    );
  }
  Widget content(){
    switch(bottomNavigationProvider.page){
      case 0: return Wallet();
      case 1: return Calendar();
      case 2: return Statistics();
      case 3: return More();
      default : return Container();
    }
  }
  Widget bottomNavigation(){
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(

        onTap: (index) => bottomNavigationProvider.changePage(index),
        currentIndex: bottomNavigationProvider.page,
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_rounded),
              label: '자산'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded),
              label: '달력'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_rounded),
              label: '통계'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_rounded),
              label: '더보기'
          )
        ],
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.shade800,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold),
        selectedLabelStyle: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w700),
        selectedItemColor: primaryColor,
        iconSize: 32,
      ),
    );
  }
}