import 'package:flutter/material.dart';
import 'package:nogod/costom_widget/help_card.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColor.orangeColor,
        elevation: 0,
        title: AllText.helpText,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: AllColor.orangeColor,
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AllText.allTimeText,
                AllText.allhelpText,
                const Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    SizedBox(
                        height: 150, width: 150, child: AllIcon.helpMailIcon),
                    Positioned(
                      left: -5,
                      child: AllIcon.helpCallIcon,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CostomHelpCard(
                onTap: () {
                  String call = "tel:16167";

                  // ignore: deprecated_member_use
                  launch(call);
                },
                icon: AllIcon.callIcon,
                text: AllText.callText,
              ),
              CostomHelpCard(
                onTap: () {
                  String call = "tel:09609616167";

                  // ignore: deprecated_member_use
                  launch(call);
                },
                icon: AllIcon.callIcon,
                text: AllText.taliphoneText,
              ),
              CostomHelpCard(
                onTap: () {
                  String mail = "mailto:info@nagad.com.bd";

                  // ignore: deprecated_member_use
                  launch(mail);
                },
                icon: AllIcon.mailIcon,
                text: AllText.mailText,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 1,
            color: AllColor.blackColor,
          )
        ],
      ),
    );
  }
}
