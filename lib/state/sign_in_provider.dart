import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SignInProvider extends ChangeNotifier {
  bool isKakaoSignIn = false;
  bool isGoogleSignIn = false;

  Future<void> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signIn();
  }

  Future<void> signInWithKakao() async {
    // isKakaoSignIn = true;
    // notifyListeners();
    // OAuthToken? _token = await UserApi.instance.loginWithKakaoTalk();
    // await TokenManagerProvider.instance.manager.setToken(_token);
    // User? _user = await UserApi.instance.me();

    // isKakaoSignIn = false;
    // notifyListeners();
  }
}
