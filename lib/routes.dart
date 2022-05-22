import 'package:flutterapp/about/about.dart';
import 'package:flutterapp/profile/profile.dart';
import 'package:flutterapp/login/login.dart';
import 'package:flutterapp/topics/topics.dart';
import 'package:flutterapp/home/home.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};