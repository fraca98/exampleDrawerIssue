import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_repository/league_repository.dart';
import 'package:mv/league_details/league_details.dart';

class LeagueDetailsPage extends StatelessWidget {
  const LeagueDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeagueDetailsBloc(
        leagueRepository: context.read<LeagueRepository>(),
      )..add(const LeagueDetailsLoadRequested()),
      child: const LeagueDetailsView(),
    );
  }
}

class LeagueDetailsView extends StatelessWidget {
  const LeagueDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LeagueDetailsBloc>().state;
    return Center(
      child: switch (state) {
        LeagueDetailsLoadInProgress() => const CircularProgressIndicator(),
        LeagueDetailsLoadFailure() => const Text('Something went wrong'),
        LeagueDetailsLoadSuccess() => DetailsView(details: state.details),
      },
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({required this.details, super.key});

  final LeagueDetails? details;

  @override
  Widget build(BuildContext context) {
    if (details == null) return const SizedBox();
    return Text('$details');
  }
}
