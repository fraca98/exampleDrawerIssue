part of 'league_details_bloc.dart';

sealed class LeagueDetailsEvent extends Equatable {
  const LeagueDetailsEvent();

  @override
  List<Object> get props => [];
}

class LeagueDetailsLoadRequested extends LeagueDetailsEvent {
  const LeagueDetailsLoadRequested();
}
