import 'dart:developer';
import 'package:buysellbiz/Data/DataSource/Resources/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';



class GoogleRepo {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);


        user = userCredential.user;
        log('user$user');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          log('Error');
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          log('Invalid Cred error');
          // handle the error here
        }
      } catch (e) {
        // handle the error here
      }
    }
    log('return');

    return user;
  }

  static handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return  Container();
        }else{
          return  Container();
        }
      },);
  }
}