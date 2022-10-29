import 'package:flutter/material.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Email: ',
              style: TextStyle(
                fontSize: 20.0,

              ),),

            Text('Password: ',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),

            ElevatedButton(
              child: Text('BACK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
