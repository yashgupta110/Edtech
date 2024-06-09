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
  int _currentPage = 0;
  final List<Widget> _pages = [
    const Geminiwid(),
    const Courses(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        backgroundColor: Theme.of(context).primaryColorLight,
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _onPageChanged(0),
                  icon: const Icon(Icons.chat_bubble),
                  label: const Text(
                    'Chat Bot',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: _currentPage == 0
                        ? WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onSecondaryContainer)
                        : WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onSecondary),
                    foregroundColor: _currentPage == 0
                        ? WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onSecondary)
                        : WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onTertiaryFixed),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _onPageChanged(1),
                  icon: const Icon(Icons.book),
                  label: const Text('Courses',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                    backgroundColor: _currentPage == 1
                        ? WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onSecondaryContainer)
                        : WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onSecondary),
                    foregroundColor: _currentPage == 1
                        ? WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onSecondary)
                        : WidgetStateProperty.all(
                            Theme.of(context).colorScheme.onTertiaryFixed),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentPage],
    );
  }
}
