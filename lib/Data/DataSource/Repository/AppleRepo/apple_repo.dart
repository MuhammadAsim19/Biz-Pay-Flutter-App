import 'dart:convert';
import 'dart:math';

import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleRepo {
  static Future<UserCredential?> signInWithApple({required BuildContext context}) async {

    try{
      // FirebaseAuth auth = FirebaseAuth.instance;
      //  User? user;


      // final AppleAuthProvider appleAuthProvider = AppleAuthProvider();
      // appleAuthProvider.addScope('email');
      // appleAuthProvider.addScope('displayName');
      // appleAuthProvider.addScope('photoURL');
      //
      // print(appleAuthProvider.parameters);
      //
      // return await FirebaseAuth.instance.signInWithProvider(appleAuthProvider);
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      print(appleCredential);

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);


    } catch (e) {
      // handle the error here

      print(e);
      rethrow;
    }
    return null;

  }
static  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  static Future<UserCredential?>  getAppleLoginData(BuildContext context) async
  {
    return await signInWithApple(context: context).then((userData) {

      return userData;

    });
    // SharedPrefs.setUserLoginData(userRawData: userRawData);
    //  var email=userData!.user?.email;
    //  var name =userData!.user?.displayName;
    //  var photoUrl=userData!.user?.photoURL;
    //  print(userData!.user?.email);
    //  print(userData!.user?.displayName);
    //  print(userData!.user?.photoURL);



  }

//     ///new package the apple sigin
//   Future<User?> signInWithTheApple() async {
//     final AuthorizationResult result = await  TheAppleSignIn.performRequests([
//       const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
//     ]);
//
//     switch (result.status) {
//       case AuthorizationStatus.authorized:
//         final AppleIdCredential? appleIdCredential = result.credential;
//
//         OAuthProvider oAuthProvider =
//         OAuthProvider("apple.com");
//
//         final AuthCredential credential = oAuthProvider.credential(
//         idToken: authorizedAppleCredential['appleIdCredential']['identityToken'],
//       accessToken: authorizedAppleCredential['appleIdCredential']
//         );
//
//        var user= await FirebaseAuth.instance.signInWithCredential(credential);
//         return user.user;
//
//
//       case AuthorizationStatus.error:
//         print('Sign in failed: ${result.error?.localizedDescription}');
//         break;
//
//       case AuthorizationStatus.cancelled:
//         print('User cancelled');
//         break;
//     }
//
// return null;
//   }

}