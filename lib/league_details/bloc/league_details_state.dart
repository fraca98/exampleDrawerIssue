part of 'league_details_bloc.dart';

sealed class LeagueDetailsState extends Equatable {
  const LeagueDetailsState();

  @override
  List<Object?> get props => [];
}

class LeagueDetailsLoadInProgress extends LeagueDetailsState {
  const LeagueDetailsLoadInProgress();
}

class LeagueDetailsLoadSuccess extends LeagueDetailsState {
  const LeagueDetailsLoadSuccess({required this.details});

  final LeagueDetails? details;

  @override
  List<Object?> get props => [details];
}

class LeagueDetailsLoadFailure extends LeagueDetailsState {
  const LeagueDetailsLoadFailure();
}
