import 'package:flutter/material.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';

class CashOutyPage extends StatefulWidget {
  const CashOutyPage({super.key});

  @override
  State<CashOutyPage> createState() => _CashOutyPageState();
}

class _CashOutyPageState extends State<CashOutyPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController sendmoneyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: AllText.cashOutBarText,
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50),
              child: AllText.cashOutPeopleText,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextFormField(
                controller: sendmoneyController,
                maxLength: 11,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: AllIcon.callIcon,
                  suffixIcon: InkWell(onTap: () {}, child: AllIcon.arrowIcon),
                  counterText: "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50, bottom: 10),
              child: AllText.cashOut11Text,
            ),
          ],
        ),
      ),
    );
  }
}
