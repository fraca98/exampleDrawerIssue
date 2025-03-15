import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_repository/league_repository.dart';

import 'package:mv/league_selector/league_selector.dart';

class LeagueSelectorDrawer extends StatelessWidget {
  const LeagueSelectorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeagueSelectorBloc(
        leagueRepository: context.read<LeagueRepository>(),
      )..add(const LeagueSelectorLeaguesRequested()),
      child: const LeagueSelectorView(),
    );
  }
}

class LeagueSelectorView extends StatelessWidget {
  const LeagueSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LeagueSelectorBloc>().state;
    return Drawer(
      child: Center(
        child: switch (state.status) {
          LeagueSelectorStatus.loading => const CircularProgressIndicator(),
          LeagueSelectorStatus.error => const Text('Something went wrong'),
          LeagueSelectorStatus.success => LeagueSelector(
              activeLeague: state.activeLeague,
              leagues: state.leagues,
            ),
        },
      ),
    );
  }
}

class LeagueSelector extends StatelessWidget {
  const LeagueSelector({required this.leagues, this.activeLeague, super.key});

  final List<League> leagues;
  final League? activeLeague;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: activeLeague ?? leagues.first,
      onChanged: (String? newLeague) {
        context
            .read<LeagueSelectorBloc>()
            .add(LeagueSelectorLeagueSelected(selectedLeague: newLeague));
      },
      items: [
        for (final league in leagues)
          DropdownMenuItem<String>(
            value: league,
            child: Text(league),
          ),
      ],
    );
  }
}
