import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nogod/costom_widget/bottom_icon.dart';
import 'package:nogod/function/firebase_function.dart';
import 'package:nogod/models/data_model.dart';
import 'package:nogod/pages/help_page.dart';
import 'package:nogod/pages/home_page.dart';
import 'package:nogod/pages/ragitation_page.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';
import 'package:url_launcher/url_launcher.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({super.key});

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {
  TextEditingController pinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool inactive = false;
  bool p = false;
  bool login = false;
  String? pin = "";
  String? phoneNumber;

  Future<bool> loginCheck(phone, password) async {
    List<UserInfoModel> data = await FirebaseGetData().getData();
    print("...${data.length}");
    for (var i in data) {
      if (i.phone == phone && i.password == password) {
        pin = password;
        phoneNumber = phone;
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColor.whiteColor,
        body: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/nogod_logo.png",
                              height: 50,
                              width: 100,
                            ),
                            AllText.nagadOrangeText,
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 0, bottom: 0),
                              child: TextFormField(
                                controller: phoneController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: AllIcon.callIcon,
                                  label: AllText.mobileText,
                                  counterText: "",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 0, bottom: 8),
                              child: TextFormField(
                                controller: pinController,
                                obscureText: !false,
                                onChanged: (value) {
                                  setState(() {
                                    if (pinController.text.length > 3) {
                                      inactive = true;
                                    } else {
                                      inactive = false;
                                    }
                                  });
                                },
                                maxLength: 4,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon: AllIcon.lockIcon,
                                  label: AllText.pinText,
                                  counterText: "",
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: InkWell(
                                onTap: () async {
                                  login = await loginCheck(
                                      phoneController.text, pinController.text);
                                  if (login == true) {
                                    Get.to(const HomePage());
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: AllText.loginFieldText,
                                        duration: Duration(seconds: 10),
                                      ),
                                    );
                                  }
                                },
                                child: SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    color: pinController.text.length == 4
                                        ? AllColor.orangeColor
                                        : AllColor.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AllColor.orangeColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: login == true
                                          ? AllText.loginSucecsText
                                          : AllText.loginText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(RagitationPage());
                                },
                                child: AllText.forgetPinText),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CostomBottomIcon(
                                onPressed: () {
                                  String url =
                                      "https://www.google.com/maps/@25.6445446,88.624134,15z?entry=ttu";

                                  // ignore: deprecated_member_use
                                  launch(url);
                                },
                                icon: AllIcon.mapMixin,
                                text: AllText.mobileText,
                              ),
                              CostomBottomIcon(
                                onPressed: () {
                                  String url = "https://www.nagad.com.bd/";

                                  // ignore: deprecated_member_use
                                  launch(url);
                                },
                                icon: AllIcon.offerIcon,
                                text: AllText.offerText,
                              ),
                              CostomBottomIcon(
                                onPressed: () {
                                  Get.to(HelpPage);
                                },
                                icon: AllIcon.helpIcon,
                                text: AllText.helpText,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  land() {}
}
