import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_account_book/View/Wallet/WriteAccount/write_account_controller.dart';
import 'package:shared_account_book/config.dart';
class WriteAccount extends StatelessWidget {
  WriteAccount({Key? key}) : super(key: key);
  late WriteAccountController _writeAccountController;
  @override
  Widget build(BuildContext context) {
    _writeAccountController = Provider.of<WriteAccountController>(context);
    double height = getHeight(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
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
                Row(
                  children: List.generate(4, (index) => TabItem(index: index, name: _writeAccountController.tabItemName[index])),
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
                  child:SingleChildScrollView(
                    child: (_writeAccountController.tab == 0) ? Spend() :
                    (_writeAccountController.tab == 1) ? FixedSpend() :
                    (_writeAccountController.tab == 2) ? Income() : Budget(),
                  )

                ),
                Center(
                  child: GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=> WriteAccount()),
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
class TabItem extends StatelessWidget {
  TabItem({
    required this.index,
    required this.name
  });

  int index;
  String name;
  late WriteAccountController _writeAccountController;
  @override
  Widget build(BuildContext context) {
    _writeAccountController = Provider.of<WriteAccountController>(context);
    return Expanded(
      child: GestureDetector(
        onTap: () => _writeAccountController.changeTab(index),
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: (_writeAccountController.tab == index) ? primaryColor : Colors.transparent,
                width: 2
              )
            )
          ),
          child: Center(child: Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: (_writeAccountController.tab == index) ? primaryColor : Colors.grey,fontSize: 16.sp),)),
        ),
      ),
    );
  }
}

class Spend extends StatelessWidget {
  const Spend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class FixedSpend extends StatelessWidget {
  const FixedSpend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                       Column(
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
          maxLines: 3,
        ),
      ],
    );
  }
}

class Income extends StatelessWidget {
  const Income({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class Budget extends StatelessWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
