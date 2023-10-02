import 'package:flutter/material.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';

class AddMoneyPage extends StatefulWidget {
  const AddMoneyPage({super.key});

  @override
  State<AddMoneyPage> createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AllText.addMoneyBarText,
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: AllText.addMoeyNumberText,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: AllIcon.personIcon,
                title: AllText.taliphoneText,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Divider(
                height: 1,
                color: AllColor.blackColor,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: AllIcon.personIcon,
                title: AllText.taliphoneText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
