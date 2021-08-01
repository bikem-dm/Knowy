import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final CollectionReference groupCollection = Firestore.instance.collection('groups');

  Future<void> updateUserData(String name, String surname, String email, String password) async {
    return await userCollection.document(uid).setData({
      'Name': name,
      'Surname': surname,
      'Email': email,
      'Password' : password,
      'Bio' : '',
      'Group IDs' : '',
    });
  }

  Future<void> createGroup(String name, String bio) async {
    return await groupCollection.add({
      'Group Name' : name,
      'Group Description' : bio,
      'Member List' : '',
    }).then((value) => print("Group Added"))
      .catchError((error) => print("Failed to add group: $error"));
  }

}