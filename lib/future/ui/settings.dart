import 'package:btchat/constens/colors.dart';
import 'package:btchat/future/auth/signin_screen.dart';
import 'package:btchat/future/ui/userprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.colorblack,
            appBar: AppBar(
              backgroundColor: AppColors.colorblack,
              leading: IconButton(
                  onPressed: () {},
                  icon: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.colorFFF,
                    ),
                  )),
              title: Text(
                "Settings",
                style: TextStyle(color: AppColors.colorFFF),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: double.infinity,
                  height: 522.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        //profile
                        ListTile(
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
                            title: Text(
                              "Nazrul lslam",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                            subtitle: Text(
                              "Never give up🦾",
                              style: TextStyle(color: AppColors.colorC7B),
                            ),
                            trailing: const Column(
                              children: [Icon(Icons.qr_code_scanner)],
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        //Divider
                        Divider(
                          height: 25,
                          color: AppColors.colorC7B,
                          thickness: 0.1,
                          indent: 01,
                          endIndent: 10,
                        ),
                        //account
                        ListTile(
                          leading: IconButton(
                              onPressed: () {
                                userprofilenavigator();
                              },
                              icon: Icon(
                                Icons.vpn_key_off_sharp,
                                color: AppColors.colorC7B,
                              )),
                          title: Text(
                            "Account",
                            style: TextStyle(
                                color: AppColors.colorblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "Privacy, security, change number",
                            style: TextStyle(color: AppColors.colorC7B),
                          ),
                        ),
                        //chat
                        ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.chat, color: AppColors.colorC7B),
                          ),
                          title: Text(
                            "Chat",
                            style: TextStyle(
                                color: AppColors.colorblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "CHat history,theme,wallpapers",
                            style: TextStyle(color: AppColors.colorC7B),
                          ),
                        ),
                        //notifications
                        ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications,
                                color: AppColors.colorC7B),
                          ),
                          title: Text(
                            "Notifications",
                            style: TextStyle(
                                color: AppColors.colorblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "Messages, group and others",
                            style: TextStyle(color: AppColors.colorC7B),
                          ),
                        ),
                        //Help
                        ListTile(
                          leading: Icon(Icons.help, color: AppColors.colorC7B),
                          title: Text(
                            "Help",
                            style: TextStyle(
                                color: AppColors.colorblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "Help center, contact us, privacy  policy",
                            style: TextStyle(color: AppColors.colorC7B),
                          ),
                        ),
                        //storage and data
                        ListTile(
                          leading: Icon(Icons.compare_arrows_rounded,
                              color: AppColors.colorC7B),
                          title: Text(
                            "Storage and data",
                            style: TextStyle(
                                color: AppColors.colorblack,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          subtitle: Text(
                            "Network usage, stogare usage",
                            style: TextStyle(color: AppColors.colorC7B),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        //Logout button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(180, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              backgroundColor: const Color(0xFF24786D)),
                          onPressed: () async {
                            await signOut();
                            signoutnavigator();
                          },
                          child: const Text(
                            'Logout',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

//signout
  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Your Are LogOut Sucessfull'),
        backgroundColor: AppColors.color86D,
        elevation: 50,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Your Are\'t Sucessfull LogOut,\nPlease Try Agin'),
        backgroundColor: AppColors.color86D,
        elevation: 50,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
      ));
    }
  }

//sinoutnavigator
  void signoutnavigator() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIScreenn(),
        ));
  }

//user profile
  void userprofilenavigator() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const UserProfile(),
        ));
  }
}
