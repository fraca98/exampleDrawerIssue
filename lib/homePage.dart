import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mv/league/league_bloc.dart';
import 'package:mv/leagueList/league_list_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeagueBloc(),
      child: HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: CustomDrawer(),
      body: BlocBuilder<LeagueBloc, LeagueState>(
        builder: (context, state) {
          if (state is LeagueLoaded) {
            return Center(child: Text(state.detail));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<LeagueListBloc, LeagueListState>(
        builder: (context, state) {
          if (state is LeagueListLoaded) {
            return Center(
              child: DropdownButton<String>(
                value: state.selectedLeaugue, // Selected league
                onChanged: (String? newLeague) {
                  if (newLeague != null && newLeague != state.selectedLeaugue) {
                    context
                        .read<LeagueListBloc>()
                        .add(LeagueListUpdateSelection(newLeague: newLeague));
                    context
                        .read<LeagueBloc>()
                        .add(LeagueFetch(leagueName: newLeague));
                  }
                },
                items: state.leagueNames.map<DropdownMenuItem<String>>(
                  (String league) {
                    return DropdownMenuItem<String>(
                      value: league,
                      child: Text(league),
                    );
                  },
                ).toList(),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
