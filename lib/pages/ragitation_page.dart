import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nogod/costom_widget/costom_textfromfield.dart';
import 'package:nogod/function/firebase_function.dart';
import 'package:nogod/pages/loging_page.dart';
import 'package:nogod/static/all_colors.dart';
import 'package:nogod/static/all_icons.dart';
import 'package:nogod/static/all_texts.dart';

class RagitationPage extends StatefulWidget {
  const RagitationPage({super.key});

  @override
  State<RagitationPage> createState() => _RagitationPageState();
}

class _RagitationPageState extends State<RagitationPage> {
  String? images;

  sendImage() async {
    var dataKye = DateTime.now().microsecond;

    var imagePath = await FirebaseStorage.instance
        .ref(
          "Nagad_User",
        )
        .child(
          "User_$dataKye",
        )
        .putFile(File(image!.path));
    images = await imagePath.ref.getDownloadURL();
    setState(() {});
  }

  var formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController nidController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confamPasswordController = TextEditingController();
  bool passwordValidator = false;
  bool confamPasswordValidator = false;
  XFile? image;

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: image == null
                  ? AssetImage("assets/images/person.jpg") as ImageProvider
                  : FileImage(
                      File(image!.path),
                    ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 120.0,
                                    width: 100.0,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            ImagePicker p = ImagePicker();
                                            image = await p.pickImage(
                                                source: ImageSource.camera);
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            leading: Icon(Icons.camera_alt),
                                            title: Text("Camera"),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            ImagePicker p = ImagePicker();
                                            image = await p.pickImage(
                                                source: ImageSource.gallery);
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            leading: Icon(Icons.photo),
                                            title: Text("Gallery"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(Icons.camera_alt),
                        ) // change this children
                        ),
                  )
                ],
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CostomTextField(
                        labelText: "Name",
                        controller: nameController,
                        validator: true,
                        errortext: "Enter your name"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CostomTextField(
                        labelText: "NID",
                        controller: nidController,
                        validator: true,
                        errortext: "Enter your NID"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CostomTextField(
                        labelText: "Data of birth",
                        controller: birthController,
                        prefixIcon: AllIcon.dateIcon,
                        validator: true,
                        errortext: "Data of birth"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CostomTextField(
                        labelText: "Phone",
                        controller: phoneController,
                        prefixIcon: AllIcon.callIcon,
                        validator: true,
                        errortext: "Enter your phone"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CostomTextField(
                        maxLength: 4,
                        labelText: "Password",
                        controller: passwordController,
                        validator: passwordValidator,
                        prefixIcon: AllIcon.lockIcon,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwordValidator = !passwordValidator;
                              });
                            },
                            icon: Icon(
                              passwordValidator
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AllColor.orangeColor,
                            )),
                        errortext: "Enter your Password"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: CostomTextField(
                        maxLength: 4,
                        labelText: "Confirm Password",
                        controller: confamPasswordController,
                        validator: confamPasswordValidator,
                        prefixIcon: AllIcon.lockIcon,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                confamPasswordValidator =
                                    !confamPasswordValidator;
                              });
                            },
                            icon: Icon(
                              confamPasswordValidator
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AllColor.orangeColor,
                            )),
                        errortext: "Enter your confirm password"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () async {
                  if (passwordController.text.length == 4 &&
                      confamPasswordController.text.length == 4) {
                    if (formkey.currentState!.validate()) {
                      if (nameController == nameController &&
                          nidController == nidController &&
                          birthController == birthController &&
                          phoneController == phoneController &&
                          passwordController == passwordController &&
                          confamPasswordController ==
                              confamPasswordController) {
                        if (passwordController.text ==
                            confamPasswordController.text) {
                          EasyLoading.show(status: 'loading...');
                          setState(() async {
                            await sendImage();
                            await FirebaseData().sendData(
                              nameController.text,
                              nidController.text,
                              passwordController.text,
                              phoneController.text,
                              confamPasswordController.text,
                              birthController.text,
                              images.toString(),
                            );

                            EasyLoading.showSuccess('Great Success!');

                            Get.to(LogingPage());
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AllText.passConfamText,
                              duration: Duration(seconds: 10),
                            ),
                          );
                        }
                      }
                    }
                  }else{
                     ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: AllText.pin4Text,
                              duration: Duration(seconds: 10),
                            ),
                          );
                  }
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: AllColor.orangeColor,
                    child: Center(
                      child: Text(
                        "Save",
                        style:
                            TextStyle(color: AllColor.blackColor, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )));
  }
}
