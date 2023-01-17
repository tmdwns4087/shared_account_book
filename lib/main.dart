import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_account_book/View/Calendar/calender_controller.dart';
import 'package:shared_account_book/View/Home/home.dart';
import 'package:shared_account_book/View/Home/bottom_navi_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_account_book/View/Wallet/wallet_controller.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('ko-KR');
  runApp( MyApp());
  initializeDateFormatting();
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => BottomNavigationProvider()),
          ChangeNotifierProvider(create: (BuildContext context) => WalletController()),
          ChangeNotifierProvider(create: (BuildContext context) => CalendarController()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360,690),
          builder: (context, child) {
            return MaterialApp(
                // localizationsDelegates: const [
                //   GlobalMaterialLocalizations.delegate,
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalCupertinoLocalizations.delegate,
                // ],
                // supportedLocales: const [
                //   Locale('ko', 'KR'),
                //   Locale('en', 'US'),
                // ],
                theme: ThemeData(
                    fontFamily: "normal"
                ),
                home: Home()
            );
          }
        )
    );
  }
}