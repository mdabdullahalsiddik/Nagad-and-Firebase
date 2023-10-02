import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';
import 'package:permission_handler/permission_handler.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  List<Contact> contacts = [];
  List phone = [];
  bool isLoding = true;
  getcontactPermission() async {
    if (await Permission.contacts.isGranted) {
      fetchContacts();
    } else {
      await Permission.contacts.request();
    }
  }

  fetchContacts() async {
    contacts = await ContactsService.getContacts();
    setState(() {
      isLoding = false;
    });
  }

  @override
  void initState() {
    getcontactPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController sendmoneyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: AllText.sendMonyBarText,
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 50),
              child: AllText.sendMonyPeopleText,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextFormField(
                controller: sendmoneyController,
                maxLength: 16,
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
              child: AllText.sendMony16Text,
            ),
            Expanded(
              child: isLoding
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        phone = contacts[index].phones!.toList();
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                               
                                });
                              },
                              child: ListTile(
                                leading: AllIcon.personIcon,
                                title: Text(
                                  contacts[index].displayName.toString(),
                                ),
                                subtitle: phone.isNotEmpty
                                    ? Text(contacts[index]
                                        .phones![0]
                                        .value
                                        .toString())
                                    : const Text(""),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: Divider(
                                height: 1,
                                color: AllColor.blackColor,
                              ),
                            )
                          ],
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
