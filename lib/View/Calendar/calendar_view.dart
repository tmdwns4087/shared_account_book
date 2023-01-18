import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_account_book/View/Calendar/calender_controller.dart';
import 'package:shared_account_book/config.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  Calendar({Key? key}) : super(key: key);
  late CalendarController _calendarController;
  @override
  Widget build(BuildContext context) {
    _calendarController = Provider.of<CalendarController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
            child: Text('달력',style: titleTextStyle,)
        ),
        SizedBox(height: 16.h,),
        GestureDetector(
          onTap: (){
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      height: 200,
                      child: CupertinoDatePicker(
                        onDateTimeChanged: (date) => _calendarController.changePage(date),
                        minimumYear: 1900,
                        maximumYear: 2030,
                        initialDateTime: _calendarController.focusedDay,
                        maximumDate: DateTime.now(),
                        mode: CupertinoDatePickerMode.date,
                      )
                  );
                }
            );
          },
          child: Row(
            children: [
              Text(
                '${_calendarController.focusedDay.year} / ${_calendarController.focusedDay.month}',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.sp),
              ),
              // SizedBox(width: 8.w,),
              // const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,size: 16,)
            ],
          ),
        ),
        SizedBox(height: 16.h,),
        TableCalendar(
            onPageChanged: (date) => _calendarController.changePage(date),
            locale: 'ko-KR',
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            focusedDay: _calendarController.focusedDay,
            firstDay: DateTime(2020,1,1),
            lastDay: DateTime(2030,12,31),
          onDaySelected: (select,focus){
            showModalBottomSheet<void>(
              backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                      // height: 200,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${select.month}월 ${select.day}일',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28.sp),),
                            SizedBox(height: 16.h,),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('분류 - 공동',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.sp),),
                                    Text('내용',style: TextStyle(color: Colors.white,fontSize: 16.sp),),
                                  ],
                                ),
                                const Spacer(),
                                Text('-123,456',style: TextStyle(color: Colors.white,fontSize: 22.sp),)
                              ],
                            ),
                          ],
                        ),
                      )
                  );
                }
            );
          },
        ),
        Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width:60.w,
                          child: Text('01',style: TextStyle(fontSize: 46.sp,color: primaryColor,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(width: 16.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('분류',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                          Text('공동',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                        ],
                      ),
                      const Spacer(),
                      Text('-123,456',style: TextStyle(color: Colors.red.shade800,fontSize: 26),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Row(
                    children: [
                      SizedBox(
                          width:60.w,
                          child: Text('12',style: TextStyle(fontSize: 46.sp,color: primaryColor,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(width: 16.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('분류',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                          Text('공동',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                        ],
                      ),
                      const Spacer(),
                      Text('-123,456',style: TextStyle(color: Colors.red.shade800,fontSize: 26),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Row(
                    children: [
                      SizedBox(
                          width:60.w,
                          child: Text('26',style: TextStyle(fontSize: 46.sp,color: primaryColor,fontWeight: FontWeight.bold),)
                      ),
                      SizedBox(width: 16.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('분류',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                          Text('공동',style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.grey),),
                        ],
                      ),
                      const Spacer(),
                      Text('+123,456',style: TextStyle(color: Colors.blue.shade800,fontSize: 26),)
                    ],
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}
