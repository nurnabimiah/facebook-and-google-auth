



import 'package:facebook_auth/screens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          facebookLogin();

        }, child: Text('Login With Facebook'),

        ),
      ),

    );
  }

  facebookLogin() async {
    try {
      final result =
      await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print('facebook_login_data:-');
        print('Hello Bangladesh.............................................');
        print(userData);
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsScreen(image: userData['picture']['data']['url'],
            name: userData['name'], email: userData['email'])));
      }
    } catch (error) {
      print(error);
    }
  }



}
