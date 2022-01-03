import 'package:flutter/material.dart';
import 'package:post_api_practice/pages/Services/ApiHelper.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    APIHelper.getPosts().then((value) {
      print("Homepage Posts: $value");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
