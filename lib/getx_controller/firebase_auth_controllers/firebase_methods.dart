import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instagram/utils/routes.dart';

class FirebaseMethods extends GetxController{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static void addRegisterData({required String name,required String email,String? userName,String? bio}){

    var uid = FirebaseAuth.instance.currentUser?.uid;

    if(name.isNotEmpty && email.isNotEmpty){
      FirebaseFirestore.instance.collection("registerUsers").doc(uid).set({
        "Uid": uid,
        "Name":name,
        "Email":email,
        "userName":userName,
        "bio":bio
      }).then((value){
        print("data inserted");
      });
    }
  }

  static void updateRegisterData(String name,String userName,String bio){

    var uid = FirebaseAuth.instance.currentUser?.uid;

    if(name.isNotEmpty){
      FirebaseFirestore.instance.collection("registerUsers").doc(uid).update({
        "Name":name,
        "userName":userName,
        "bio":bio
      }).then((value){
        print("data inserted");
        Get.offAllNamed(MyRoutes.profile);
      });
    }
  }


  // Observable user data
  var userData = {}.obs;

  // Method to fetch current user data
  Future<void> fetchUserData() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot userDoc = await _firestore
            .collection('registerUsers')
            .doc(currentUser.uid)
            .get();

        if (userDoc.exists) {
          userData.value = userDoc.data() as Map<String, dynamic>;
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}