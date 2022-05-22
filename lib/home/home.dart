import 'package:flutter/material.dart';
import 'package:flutterapp/about/about.dart';
import 'package:flutterapp/services/auth.dart';
import 'package:flutterapp/login/login.dart';
import 'package:flutterapp/shared/shared.dart';
import 'package:flutterapp/topics/topics.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: ErrorMessage(),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        }
        else {
          return const LoginScreen();
        }
      }
    );
  }
}

/*class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ElevatedButton(child: Text('about'),
          onPressed: () => Navigator.pushNamed(context, '/about'),
          ),

          ElevatedButton(child: Text('topics'),
            onPressed: () => Navigator.pushNamed(context, '/topics'),
          ),

        ]
      ),
    );
  }
}*/
