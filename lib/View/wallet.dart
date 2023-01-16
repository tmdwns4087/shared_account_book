import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_account_book/View/write_account.dart';
import 'package:shared_account_book/config.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
              child: Text('자산',style: titleTextStyle,)
          ),
          SizedBox(height: MediaQuery.of(context).size.height/12,),

          Expanded(
            child: Row(
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.grey.shade700,)),
                Expanded(
                  // height: MediaQuery.of(context).size.height-50,
                  child: PageView(

                    physics: BouncingScrollPhysics(),

                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 32.0,
                              percent: 0.689,
                              progressColor: secondaryColor,
                              circularStrokeCap: CircularStrokeCap.round,
                            ),
                            const SizedBox(height: 48,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/1.5,
                              height: MediaQuery.of(context).size.height/10,
                              //color: Colors.blue,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Text('이번달 지출',style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
                                      Text('₩128,000',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 22),),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: CustomPaint(
                                      size: Size(MediaQuery.of(context).size.width/7,MediaQuery.of(context).size.height/15,),
                                      painter: MyPainter(),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child:Column(
                                      children: [
                                        Text('이번달 예산',style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
                                        Text('₩150,000',style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 22),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 30.0,
                          percent: 0.5,
                          progressColor: secondaryColor,
                        ),

                      ]
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade700,)),
              ],
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
                width: 110,
                height: 50,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('가계부 입력',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/12,)
        ],
      ),
    );
  }
}
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(00, size.height);
    final p2 = Offset(size.width, 00);
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 2
    ..strokeCap = StrokeCap.round;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
