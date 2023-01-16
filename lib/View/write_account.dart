
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_account_book/View/calendar.dart';
import 'package:shared_account_book/View/more.dart';
import 'package:shared_account_book/View/statistics.dart';
import 'package:shared_account_book/View/wallet.dart';
import 'package:shared_account_book/bottom_navi_provider.dart';
import 'package:shared_account_book/config.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';




class WriteAccount extends StatelessWidget {
  const WriteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(width/13,20,width/13,0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('가계부 입력',
                        style:TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        )
                    ),
                    IconButton(onPressed: (){
                       Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      iconSize:30,
                      color: Colors.grey.shade700,
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                TabBar(
                  labelColor: primaryColor,
                  unselectedLabelColor: Colors.grey,
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorColor: primaryColor,
                  indicatorWeight: 1.5,
                  tabs: const[
                    SizedBox(
                      height: 40,
                      child: Text('지출',
                        style: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w900,
                          fontSize: 17
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text('고정지출',
                        style: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w900,
                          fontSize: 17
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text('수입',
                        style: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w900,
                          fontSize: 17
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Text('예산',
                        style: TextStyle(
                          height: 2,
                          fontWeight: FontWeight.w900,
                          fontSize: 17
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top:17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFFFFF),
                            side: const BorderSide(
                                color: Color(0xffA0A0A0),
                                width: 1.5
                            ),
                            minimumSize: const Size(160, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 0.0
                        ),
                        child: const Text('개인',
                            style:TextStyle(
                                color: Color(0xffA0A0A0),
                                fontSize: 17,
                                fontWeight: FontWeight.w800
                            )
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff7354B2),
                            side: const BorderSide(
                                color: Color(0xff7354B2),
                                width: 1.5
                            ),
                            minimumSize: const Size(160, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 0.0
                        ),
                        child: const Text('공동',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800
                          ),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("날짜",
                            style: TextStyle(
                                fontSize:17,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'YYYY-MM-DD',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("금액",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("분류",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("내용",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("날짜",
                            style: TextStyle(
                                fontSize:17,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'YYYY-MM-DD',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("기한",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("금액",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("분류",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("내용",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("날짜",
                            style: TextStyle(
                                fontSize:17,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'YYYY-MM-DD',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("금액",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("분류",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("내용",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("날짜",
                            style: TextStyle(
                                fontSize:17,
                                fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'YYYY-MM-DD',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("금액",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            height: 40,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("내용",
                              style: TextStyle(
                                  fontSize:17,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                          SizedBox(height: 3),
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                          ),
                        ],
                      )
                    ]
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=> const WriteAccount()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('가계부 입력',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                    ),
                  ),
                ),
                SizedBox(height: height*0.04,)
              ]
            ),
          ),
        ),
      ),
    );
  }
}