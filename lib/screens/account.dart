import 'package:edtech/screens/achievements.dart';
import 'package:edtech/screens/settings.dart';
import 'package:edtech/widgets/progress.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Progress'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Achievements'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AchievementsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Personal Information'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PersonalInformationScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Security'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecurityScreen()),
              );
            },
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 12,
                  ),
                  Text("Logout"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
      ),
      body: const Center(
        child: Text('Personal Information Screen'),
      ),
    );
  }
}

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: const Center(
        child: Text('Security Screen'),
      ),
    );
  }
}
