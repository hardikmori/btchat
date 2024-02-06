import 'package:btchat/constens/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget messagelistview() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/images/profile2.jpg",
            width: 50.w,
            height: 100.h,
            fit: BoxFit.fill,
          ),
        ),
        // title: const Text(
        //   "Alex Linderson",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        title: const Text(
          "alex linderson",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          "How are you today?",
          style: TextStyle(color: AppColors.colorC7B),
        ),
        trailing: Column(
          children: [
            Text(
              "2 min ago",
              style: TextStyle(color: AppColors.colorC7B),
            ),
            SizedBox(
              height: 04.h,
            ),
            Container(
              width: 20.w,
              height: 19.h,
              decoration: BoxDecoration(
                  color: AppColors.color4A4,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  "3",
                  style: TextStyle(color: AppColors.colorFFF),
                ),
              ),
            ),
          ],
        )),
  );
}
