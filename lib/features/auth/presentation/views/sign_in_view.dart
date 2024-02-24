import 'package:dalel_app/core/functions/navigation.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                customNavigate(context, '/signUp');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
