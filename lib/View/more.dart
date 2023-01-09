import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('김선재 병신'),
        FloatingActionButton(onPressed: (){
          FirebaseFirestore.instance
              .collection('member')
              .doc('nnPXotopD2Rk5YKoDrWv')
              .get()
              .then((value) => print(value['id']));
        },),
        SafeArea(child: Text('더보기')),
        // Text('ㄱㄱ')
      ],
    );
  }
}
