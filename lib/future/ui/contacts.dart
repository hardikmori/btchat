import 'package:btchat/constens/colors.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorblack,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: AppColors.colorblack,
                title: Text(
                  'Contacts',
                  style: TextStyle(color: AppColors.colorwhitegrey),
                ),
                centerTitle: true,
                leading: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
                actions: const <Widget>[
                  Icon(
                    Icons.person_add_alt,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
