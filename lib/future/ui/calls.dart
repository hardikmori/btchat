
import 'package:btchat/constens/colors.dart';
import 'package:btchat/widgets/message_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calls extends StatefulWidget {
  const Calls({super.key});

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorblack,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //AppVar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: AppBar(
              backgroundColor: AppColors.colorblack,
              title: Text(
                "Calls",
                style: TextStyle(color: AppColors.colorwhitegrey),
              ),
              centerTitle: true,
              leading: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              actions: <Widget>[
                Icon(
                  Icons.call_outlined,
                  color: AppColors.colorwhitegrey,
                )
              ],
            ),
          ), //chat
          SizedBox(
            height: 15.h,
          ),
          Container(
              width: double.infinity,
              height: 450.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    messagelistview(),
                    SizedBox(
                      height: 5.h,
                    ),
                    messagelistview(),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
