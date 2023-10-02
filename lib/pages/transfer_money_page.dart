import 'package:flutter/material.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';

class TransferMonyPage extends StatefulWidget {
  const TransferMonyPage({super.key});

  @override
  State<TransferMonyPage> createState() => _TransferMonyPageState();
}

class _TransferMonyPageState extends State<TransferMonyPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController transferMonyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: AllText.transferMoneyBarText,
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50),
              child: AllText.transferMoneyPeopleText,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextFormField(
                controller: transferMonyController,
                decoration: const InputDecoration(
                  prefixIcon: AllIcon.bookIcon,
                  counterText: "",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50, bottom: 10),
              child: AllText.transferMoneyNameText,
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
