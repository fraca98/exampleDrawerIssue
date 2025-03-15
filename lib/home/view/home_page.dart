import 'package:flutter/material.dart';
import 'package:mv/league_details/league_details.dart';
import 'package:mv/league_selector/league_selector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      drawer: const LeagueSelectorDrawer(),
      body: const LeagueDetailsPage(),
    );
  }
}
