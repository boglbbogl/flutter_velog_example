import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SignInProvider extends ChangeNotifier {
  bool isKakaoSignIn = false;
  bool isGoogleSignIn = false;

  Future<void> signInWithKakao() async {
    isKakaoSignIn = true;
    notifyListeners();
    OAuthToken? _token = await UserApi.instance.loginWithKakaoTalk();
    await TokenManagerProvider.instance.manager.setToken(_token);
    User? _user = await UserApi.instance.me();

    isKakaoSignIn = false;
    notifyListeners();
  }
}
