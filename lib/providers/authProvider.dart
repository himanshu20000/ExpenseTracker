import 'package:cipherx_expense_tracker/screens/dashboard/Dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authprovider extends ChangeNotifier {
  bool ischecked = false;

  void isCheckbox(bool value) {
    ischecked = value;
    notifyListeners();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Function to sign up with Google
  Future<void> signUpWithGoogle(BuildContext context) async {
    print('Checking now%%%%%%%%%%');
    try {
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the GoogleSignInAuthentication object
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the Google sign-in token
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        await _auth.signInWithCredential(credential);
        print('sucess#################');

        final prefs = await SharedPreferences.getInstance();
        prefs.setString('tokenId', googleAuth.idToken.toString());
        prefs.setString('displayName', googleUser.displayName ?? '');

        final profilePicUrl = googleUser.photoUrl;
        print('Profile Picture URL: $profilePicUrl');
        prefs.setString('profilePicUrl', googleUser.photoUrl ?? '');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Dashboard(), // Replace with your next screen
          ),
        );
        // You can handle the signed-in user here, such as saving to a database
        // or updating the UI
      } else {
        // Handle the case when the user cancels the sign-in process
        print('Google sign-in cancelled');
      }
    } catch (error) {
      // Handle any errors that occur during the sign-in process
      print('Error signing in with Google: $error');
    }
  }
}
