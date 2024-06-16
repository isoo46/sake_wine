import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

void main() {
  runApp(const MyApp());
}
// a
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (data.name != 'user' || data.password != '12345') {
        return 'Username or password is incorrect';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (name != 'user') {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'LOGIN',
      onLogin: (LoginData data) {
        return _authUser(data).then((result) {
          if (result == null) {
            // ログインが成功した場合、ホーム画面に遷移する
            Navigator.of(context).pushReplacementNamed('/home');
          }
          return result;
        });
      },
      onSignup: _signupUser,
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Colors.blue,
        accentColor: Colors.white,
        errorColor: Colors.red,
      ),
      messages: LoginMessages(
        userHint: 'ユーザー名',
        passwordHint: 'パスワード',
        confirmPasswordHint: 'パスワード確認',
        loginButton: 'ログイン',
        signupButton: '登録',
        forgotPasswordButton: 'パスワードを忘れた',
        recoverPasswordButton: '送信',
        goBackButton: '戻る',
        confirmPasswordError: 'パスワードが一致しません',
        recoverPasswordIntro: 'パスワードをリセットしてください',
        recoverPasswordDescription: '登録したメールアドレスを入力してください',
        recoverPasswordSuccess: 'パスワードのリセットメールを送信しました',
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the home screen!'),
      ),
    );
  }
}
