import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../mvvm/views/screens/home.dart';


class FireBaseHelper {
  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late String _verificationCode;
  bool isLogin = false;
  static FireBaseHelper setup() {
    if (_firebaseAuth == null) {
      _firebaseAuth = FirebaseAuth.instance;
    }
    return FireBaseHelper();
  }


  Future verifyPhone(String phone) async {
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              print(value.user);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationCode = verificationId;
          print(resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          _verificationCode = verificationID;
        },
        timeout: Duration(seconds: 120));
  }

  Future verifyPin(String pinCode, BuildContext context) async {
    await _firebaseAuth
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: _verificationCode, smsCode: pinCode))
        .then((value) async {
      if (value.user != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      }
    });
  }

  Future<bool?> login({required String phone}) async {
    print(_firebaseAuth.currentUser?.phoneNumber);
    if (phone != '' &&
        phone.length == 10 &&
        '+1${phone}' == _firebaseAuth.currentUser?.phoneNumber) {
      return true;
    } else {
      return false;
    }
  }
}
