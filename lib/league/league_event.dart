part of 'league_bloc.dart';

sealed class LeagueEvent extends Equatable {
  const LeagueEvent();

  @override
  List<Object> get props => [];
}

class LeagueFetch extends LeagueEvent {
  final String leagueName;

  LeagueFetch({required this.leagueName});

  @override
  List<Object> get props => [leagueName];
}
