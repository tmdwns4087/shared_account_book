import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color primaryColor = const Color(0xFF7354B2);
Color secondaryColor = const Color(0xFFBE9FE1);
TextStyle titleTextStyle = TextStyle(fontSize: 42.sp,fontWeight: FontWeight.w900);
double getHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}
double getWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}