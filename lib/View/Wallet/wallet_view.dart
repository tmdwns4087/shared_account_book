import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_account_book/View/Wallet/wallet_controller.dart';
import 'package:shared_account_book/View/Wallet/wallet_model.dart';
import 'package:shared_account_book/View/Wallet/write_account.dart';
import 'package:shared_account_book/config.dart';
import 'package:intl/intl.dart';
class Wallet extends StatelessWidget {
  Wallet({Key? key}) : super(key: key);
  late WalletController _walletController;
  @override
  Widget build(BuildContext context) {
    _walletController = Provider.of<WalletController>(context,listen: false);
    _walletController.loadAccountUser(); //TODO 이거 로그인되면 불러오게끔 해야함
    print(_walletController.accountUser);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
            child: Text('자산',style: titleTextStyle,)
        ),
        const Spacer(),
        if(_walletController.accountUser.isNotEmpty)
        SizedBox(
          height: 450.h,
          child: Row(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.grey.shade700,
                  )
              ),
              Expanded(
                child: PageView(
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(_walletController.accountUser.length, (index) => WalletBudget(walletModel: _walletController.accountUser[index]))
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey.shade700,)),
            ],
          ),
        ),
        if(_walletController.accountUser.isNotEmpty)
          const Spacer(),
        Center(
          child: Column(
            children: [
              if(_walletController.accountUser.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    '아직 예산이 입력되지 않았어요\n 아래 버튼을 눌러 예산을 입력해주세요!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=> const WriteAccount()),
                  );
                },
                child: Container(
                  width: 110.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('가계부 입력',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16.sp),)),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

class WalletBudget extends StatelessWidget {
  WalletBudget({
    required this.walletModel
  });
  late WalletModel walletModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${walletModel.user}',style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 18.sp),),
        SizedBox(height: 16.h,),
        CircularPercentIndicator(
          radius: 100.0.w,
          lineWidth: 32.0.w,
          percent: ((walletModel.spend!/walletModel.budget!)),
          progressColor: secondaryColor,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(height: 48.h,),
        SizedBox(
          height: 75.h,
          child: Stack(
            children: [
              Column(
                children: [
                  Text('이번달 지출',style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 12.sp),),
                  Text('₩${NumberFormat('###,###,###,###').format(walletModel.spend)}',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 24.sp),),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: CustomPaint(
                  size: Size(75.w,75.h,),
                  painter: MyPainter(),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child:Column(
                  children: [
                    Text('이번달 예산',style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 12.sp),),
                    Text('₩${NumberFormat('###,###,###,###').format(walletModel.budget)}',style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold,fontSize: 24.sp),),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
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
