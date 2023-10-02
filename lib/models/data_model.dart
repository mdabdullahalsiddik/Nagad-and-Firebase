// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserInfoModel {
  String? name;
  String? nid;
  String? phone;
  String? password;
  String? confamPassword;
  String? bith;
  String? image;
  UserInfoModel({
    this.name,
    this.nid,
    this.phone,
    this.password,
    this.confamPassword,
    this.bith,
    this.image,
  });
 UserInfoModel.fromJson(dynamic json) {
    name = json['name'];
    nid = json['nid'];
    phone = json['phone'];
    password = json['password'];
    confamPassword = json['confamPassword'];
    bith = json['bith'];
    image = json['image'];
    
  }

  
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nid'] = nid;
    map['phone'] = phone;
    map['password'] = password;
    map['confamPassword'] = confamPassword;
    map['bith'] = bith;
    map['image'] = image;
 
    return map;
  }
}
