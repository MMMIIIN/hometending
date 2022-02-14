import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              loginContainerForm(0xff20C800, '네이버', false, Colors.white, () {}),
              loginContainerForm(
                  0xffFEE500, '카카오톡', false, Colors.black, () {}),
              loginContainerForm(
                  0xff3B5998, '페이스북', false, Colors.white, () async {
              }),
              loginContainerForm(
                  0xffffffff, '구글', true, Colors.black, signInWithGoogle),
              loginContainerForm(0xff000000, '애플', false, Colors.white, signInWithApple),
              MaterialButton(
                  color: Colors.orangeAccent,
                  onPressed: () {
                    print(FirebaseAuth.instance.currentUser!.email);
                    print(FirebaseAuth.instance.currentUser!.uid);
                  }),
              MaterialButton(
                  color: Colors.purple,
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget loginContainerForm(int colorValue, String textValue, bool isBorder,
      Color textColor, Function login) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          login();
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              border: isBorder ? Border.all() : null,
              color: Color(colorValue),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Row(
              children: [
                SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
                SizedBox(width: 40),
                Text(
                  '$textValue 계정으로 간편로그인',
                  style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }


}
