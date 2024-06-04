import 'package:edtech/tabs/courses.dart';
import 'package:edtech/tabs/gemini.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController( length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(24.0),
            child: TabBar(
              dividerHeight: 0,
              onTap: (v) => print(v),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: "Gemini",
                ),
                Tab(
                  text: "Courses",
                )
              ],
              indicator: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: Colors.black,
                    width: 1),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          
        ),
        body: const TabBarView(
          children: [
            Gemini(),
            Courses(),
          ],
        )
      ),
    );
  }
}
