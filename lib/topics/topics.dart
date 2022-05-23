import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/services/firestore.dart';
import 'package:flutterapp/services/models.dart';
import 'package:flutterapp/shared/bottom_nav.dart';
import 'package:flutterapp/shared/shared.dart';
import 'package:flutterapp/topics/topics_item.dart';
import 'package:flutter/foundation.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(message: snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: Text('Topics'),
              ),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children:
                    topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Text('No topics');
          }
        });
  }
}
