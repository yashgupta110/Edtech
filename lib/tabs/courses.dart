import 'package:edtech/screens/account.dart';
import 'package:edtech/screens/allcourses.dart';
import 'package:edtech/screens/cartscreen.dart';
import 'package:edtech/screens/favouriteCourses.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  int _selectIndex = 0;
  final List<String> _cart = [];

  static List<String> _mockCourses = [
    'Course 1: App Development',
    'Course 2: Machine Learning',
    'Course 3: Deep Learning',
    'Course 4: Web Development',
  ];
  static List<Widget> _widgetOptions = [
    AllCoursesScreen(
      courses: _mockCourses,
      addToCart: (course) {},
    ),
    FavoritesScreen(),
    Account(),
    CartScreen(
      cart: const [],
      removeFromCart: (course) {},
    )
  ];

  void _onitemtap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _addToCart(String course) {
    setState(() {
      _cart.add(course);
    });
  }

  void _removeFromCart(String course) {
    setState(() {
      _cart.remove(course);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectIndex == 0
          ? AllCoursesScreen(
              courses: _mockCourses,
              addToCart: _addToCart,
            )
          : _selectIndex == 3
              ? CartScreen(
                  cart: _cart,
                  removeFromCart: _removeFromCart,
                )
              : _widgetOptions[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'All Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Theme.of(context).colorScheme.onSecondaryContainer ,
        unselectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onitemtap,
      ),
    );
  }
}
