import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppleRepo {
  static Future<UserCredential?> signInWithApple({required BuildContext context}) async {

    try{
      // FirebaseAuth auth = FirebaseAuth.instance;
      //  User? user;


      final AppleAuthProvider appleAuthProvider = AppleAuthProvider();
      appleAuthProvider.addScope('email');
      appleAuthProvider.addScope('name');
      appleAuthProvider.addScope('photo');

      return await FirebaseAuth.instance.signInWithProvider(appleAuthProvider);



    } catch (e) {
      // handle the error here
    }
    return null;

  }

  static  getAppleLoginData(BuildContext context) async
  {
    var userData =await signInWithApple(context: context);
    // SharedPrefs.setUserLoginData(userRawData: userRawData);
    //  var email=userData!.user?.email;
    //  var name =userData!.user?.displayName;
    //  var photoUrl=userData!.user?.photoURL;
    //  print(userData!.user?.email);
    //  print(userData!.user?.displayName);
    //  print(userData!.user?.photoURL);

    return userData;

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