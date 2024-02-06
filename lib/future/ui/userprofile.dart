import 'package:btchat/constens/colors.dart';
import 'package:btchat/future/ui/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorblack,
        appBar: AppBar(
          backgroundColor: AppColors.colorblack,
          leading: IconButton(
              onPressed: () {
                settingnavigator();
              },
              icon: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.colorFFF,
                ),
              )),
        ),
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/profile2.jpg",
                width: 75.w,
                height: 65.h,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Jhon Abraham",
                style: TextStyle(color: AppColors.colorFFF, fontSize: 24.sp),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message_rounded,
                      color: AppColors.colorFFF,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      color: AppColors.colorFFF,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: AppColors.colorFFF,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: AppColors.colorFFF,
                    )),
              ],
            ),
            Container(
              width: double.infinity,
              height: 452.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    //Display name

                    Text(
                      "Display Name",
                      style:
                          TextStyle(color: AppColors.colorC7B, fontSize: 15.sp),
                    ),
                    Text(
                      " Jhon Abraham",
                      style: TextStyle(
                          color: AppColors.colorblack, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //Email Address
                    Text(
                      "Email Address",
                      style:
                          TextStyle(color: AppColors.colorC7B, fontSize: 15.sp),
                    ),
                    Text(
                      " jhonabrahm20@gmail.com",
                      style: TextStyle(
                          color: AppColors.colorblack, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //Address
                    Text(
                      "Address",
                      style:
                          TextStyle(color: AppColors.colorC7B, fontSize: 15.sp),
                    ),
                    Text(
                      " 33 street west subidazar, sylhet",
                      style: TextStyle(
                          color: AppColors.colorblack, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //Phone Number
                    Text(
                      "Phone Number",
                      style:
                          TextStyle(color: AppColors.colorC7B, fontSize: 15.sp),
                    ),
                    Text(
                      " (320)555-0104",
                      style: TextStyle(
                          color: AppColors.colorblack, fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    //media Shred
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Media Shared",
                          style: TextStyle(color: AppColors.colorC7B),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View All",
                            style: TextStyle(color: AppColors.color86D),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/fruits.jpg",
                            width: 85.w,
                            height: 75.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/fruits.jpg",
                            width: 85.w,
                            height: 75.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/fruits.jpg",
                                width: 85.w,
                                height: 75.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              "255+",
                              style: TextStyle(
                                color: AppColors.colorFFF,
                                height: 7.sp,
                                fontSize: 12.sp,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //user profile
  void settingnavigator() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Settings(),
        ));
  }
}
