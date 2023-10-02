import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nogod/costom_widget/home_card.dart';
import 'package:nogod/data_list/home_data.dart';
import 'package:nogod/pages/mynagad_page.dart';
import 'package:nogod/pages/people_page.dart';
import 'package:nogod/pages/transactions_page.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;
  bool inactive = false;
  Future blancechack() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        inactive = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AllColor.orangeColor,
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Center(child: AllText.nagadText),
                      trailing: AllIcon.notificationsIcon,
                      isThreeLine: true,
                      subtitle: Center(
                          child: Column(
                        children: [
                          AllText.darkBoardText,
                          InkWell(
                            onTap: () {
                              setState(() {
                                inactive = true;
                              });
                              blancechack();
                            },
                            child: inactive == false
                                ? SizedBox(
                                    height: 35,
                                    width: 220,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: AllColor.whiteColor,
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AllIcon.blanceIcon,
                                          AllText.blanceText,
                                        ],
                                      )),
                                    ),
                                  )
                                : SizedBox(
                                    height: 35,
                                    width: 220,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: AllColor.whiteColor,
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AllIcon.blanceIcon,
                                          AllText.blanceAmountText,
                                        ],
                                      )),
                                    ),
                                  ),
                          )
                        ],
                      )),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllText.sarvisText,
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 7,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemBuilder: (context, index) {
                                return CostomHomeCard(
                                  onTap: () {
                                    if (servicesAllPageRoute[index] == url) {
                                      launch(url);
                                    } else {
                                      Get.to(servicesAllPageRoute[index]);
                                    }
                                  },
                                  icon: servicesAllIcon[index],
                                  text: servicesAllText[index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllText.paymentsText,
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemBuilder: (context, index) {
                                return CostomHomeCard(
                                  onTap: () {
                                    Get.to(servicesAllPageRoute[index]);
                                  },
                                  icon: servicesAllIcon[index],
                                  text: paymentAllText[index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllText.othersText,
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemBuilder: (context, index) {
                                return CostomHomeCard(
                                  onTap: () {
                                    Get.to(servicesAllPageRoute[index]);
                                  },
                                  icon: servicesAllIcon[index],
                                  text: othersAllText[index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
