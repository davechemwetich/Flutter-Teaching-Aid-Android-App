import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: const Text("About"),
        ),
        body: Container(
          child: Center(
              child: Text(
            'CBC AI&ML App',
            style: TextStyle(
              fontSize: 23,
            ),
          )),
        ));
  }
}
