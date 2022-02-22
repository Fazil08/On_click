import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}






// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';




// class GoogleSignInController with ChangeNotifier{
//   var _googleSignIn = GoogleSignIn();
//   GoogleSignInAccount? googleAccount;

//   login(BuildContext context) async{
//     this.googleAccount = await _googleSignIn.signIn();
//     // Navigator.pushReplacement(
//     //     context,
//     //     MaterialPageRoute(
//     //         builder: (context) => const login()));
//     notifyListeners();
//   }

//   logOut() async{
//     this.googleAccount = await _googleSignIn.signOut();
//     notifyListeners();
//   }
// }