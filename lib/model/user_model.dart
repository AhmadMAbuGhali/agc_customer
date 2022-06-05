import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String name;
  late String email;
  late String phoneNumber;
  late String password;
  late String jobTitle;
  late bool isAccept;
  late bool isReject;
  late bool disable ;
  late String id;
  UserModel({
   required this.name,
   required this.email,
   required this.phoneNumber,
   required this.password,
   required this.jobTitle,
   required this.disable,
   required this.isAccept,
   required this.isReject,
});



  UserModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    phoneNumber = documentSnapshot["phoneNumber"];
    password = documentSnapshot["password"];
    jobTitle = documentSnapshot["jobTitle"];
    disable = documentSnapshot["disable"];
    isAccept = documentSnapshot["isAccept"];
    isReject = documentSnapshot["isReject"];
  }



  // UserModel.fromMap(Map<String, dynamic> map) {
  //   id = map['id'];
  //   name = map['name'];
  //   email = map['email'];
  //   phonenumber = map['phonenumber'];
  //   password = map['password'];
  //   jobtitle = map['jobtitle'];
  //   isaccept = map['isaccept'];
  //   isreject = map['isreject'];
  //   disable = map['disable'];
  //
  // }
  //
  // Map<String, dynamic> toMap() {
  //   Map<String, dynamic> map = <String, dynamic>{};
  //   map['name'] = name;
  //   map['email'] = email;
  //   map['phonenumber'] = phonenumber;
  //   map['password'] = password;
  //   map['jobtitle'] = jobtitle;
  //   map['isaccept'] = isaccept;
  //   map['isreject'] = isreject;
  //   map['disable'] = disable;
  //   map['id'] = id;
  //
  //   return map;
  // }
}
