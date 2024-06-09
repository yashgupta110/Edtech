import 'package:flutter/material.dart';

class AllCoursesScreen extends StatelessWidget {
  final List<String> courses;
  final Function(String) addToCart;
  const AllCoursesScreen(
      {super.key, required this.courses, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(courses[index]),
          trailing: ElevatedButton(
            onPressed: () => addToCart(courses[index]),
            child: const Text('Add to Cart'),
          ),
        );
      },
    );
  }
}
