


import 'package:facebook_auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserDetailsScreen extends StatefulWidget {
  final image;
  final name;
  final email;
  const UserDetailsScreen({Key? key, this.image, this.name, this.email}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  @override
  void initState() {
    print(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Details Screen'),),
      body: Column(
        children: [
          Image.network(widget.image, height: 200, width: 200,),
          Text(widget.name),
          Text(widget.email),
          SizedBox(height: 100),
          ElevatedButton(
              onPressed: (){
                FacebookAuth.i.logOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Logout')),
        ],
      ),

    );
  }
}
