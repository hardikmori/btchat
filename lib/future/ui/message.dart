
import 'package:btchat/constens/colors.dart';
import 'package:btchat/widgets/message_listview.dart';
import 'package:btchat/widgets/message_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorblack,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //AppVar
            AppBar(
              backgroundColor: AppColors.colorblack,
              title: Text(
                "Home",
                style: TextStyle(color: AppColors.colorwhitegrey),
              ),
              centerTitle: true,
              leading: const Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              actions: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/profile1.jpg",
                    width: 50.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            //Storiy
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                  messageStatus(),
                ],
              ),
            ),
            //chat
            SizedBox(
              height: 10.h,
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxHeight > 1000) {
                  return _buildWideContainers();
                } else {
                  return _buildWideContainers();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildWideContainers() {
  return Container(
    width: double.infinity,
    height: 1000.h,
    decoration: BoxDecoration(
      color: AppColors.colorwhitegrey,
      borderRadius:  const BorderRadius.only(
          topLeft: Radius.circular(60), topRight: Radius.circular(60)),
    ),
    child: ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return messagelistview();
      },
    ),
  );
}
