import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Text('Подписки'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            SizedBox(
              height: 10,
            ),
            Text('567'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),),
          ],
        ),
        SizedBox(width: 50,),
        Column(
          children: [
            Text('Подписчики'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
            SizedBox(
              height: 10,
            ),
            Text('10'.toUpperCase(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black54),),
          ],
        ),
      ],
    );
  }
}
