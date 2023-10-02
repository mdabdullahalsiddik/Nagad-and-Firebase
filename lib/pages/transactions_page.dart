import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nogod/pages/home_page.dart';
import 'package:nogod/pages/mynagad_page.dart';
import 'package:nogod/pages/people_page.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    var index = 1;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AllColor.blackColor,
        unselectedLabelStyle: const TextStyle(color: AllColor.blackColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: AllColor.whiteColor,
            icon: AllIcon.homeIcon,
            label: "Home",
          ),
          BottomNavigationBarItem(
              backgroundColor: AllColor.whiteColor,
              icon: AllIcon.readIcon,
              label: "Transactions"),
          BottomNavigationBarItem(
              icon: AllIcon.peopleIcon,
              label: "People",
              backgroundColor: AllColor.whiteColor),
          BottomNavigationBarItem(
              backgroundColor: AllColor.whiteColor,
              icon: AllIcon.accountIcon,
              label: "My Nagad"),
        ],
        currentIndex: index,
        onTap: (index) {
          setState(() {
            //  index = i;

            if (index == 0) {
              Get.to(const HomePage());
            } else if (index == 1) {
              Get.to(const TransactionsPage());
            } else if (index == 2) {
              Get.to(const PeoplePage());
            } else if (index == 3) {
              Get.to(const MyNagadPage());
            }
          });
        },
        fixedColor: AllColor.orangeColor,
      ),
    );
  }
}
