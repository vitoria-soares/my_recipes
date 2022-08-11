import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Recipes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(
        children: const [
          CookieCard(),
          //SingleChildScrollView(child: ListView.builder(itemBuilder: ())),
        ],
      ),
    );
  }
}
