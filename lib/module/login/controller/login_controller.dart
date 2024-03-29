import 'package:flutter/material.dart';
import 'package:login_latihan/core.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? email;
  String? password;
  login() async {
    bool isLoggedIn = await AuthService().loginByEmail(
      email: email!,
      password: password!,
    );

    if (!isLoggedIn) {
      const snackBar = SnackBar(
        content: Text('Gagal Login!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    Get.offAll(MainNavigationView());
  }
}
