part of 'league_list_bloc.dart';

@immutable
sealed class LeagueListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LeagueListFetch extends LeagueListEvent {}

class LeagueListUpdateSelection extends LeagueListEvent {
  final String newLeague;

  LeagueListUpdateSelection({required this.newLeague});

  @override
  List<Object> get props => [newLeague];
}
