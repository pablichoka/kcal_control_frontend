import 'package:flutter/material.dart';
import 'package:kcal_control_frontend/forms/login.dart';
import 'package:kcal_control_frontend/forms/signup.dart';
import 'package:kcal_control_frontend/pages/homePage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  final String title = "kCal Control";

  @override
  State<StatefulWidget> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  Widget _currentScreen = const HomePage();
  void _changeScreen(Widget screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title,
            style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueAccent, Colors.grey, Colors.teal],
            ),
          ),
        ),
      ),
      body: _currentScreen,
      bottomNavigationBar:  BottomNavigationBar(
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Pantalla 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Pantalla 2',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            _changeScreen(const HomePage());
          } else {
            _changeScreen(const LoginPage());
          }
        },
      ),
    );
  }
}
