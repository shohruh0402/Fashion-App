import 'package:fashionapp/screens/sizeconfig.dart';
import 'package:flutter/material.dart';

class MyAppBarWidgets extends StatelessWidget {
  Color? color = Color(0xFFE7EAEF);
  MyAppBarWidgets({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: he(100),
      width: double.infinity,
      color: color,
      child: Padding(
        padding: EdgeInsets.only(top: he(30), left: wi(16), right: wi(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            SizedBox(
              width: wi(30),
            ),
            Image.asset(
              'assets/textimg/Logo.png',
              height: he(32),
              width: wi(78),
            ),
            SizedBox(),
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: wi(15)),
                Icon(Icons.shopping_bag),
              ],
            )
          ],
        ),
      ),
    );
  }
}
