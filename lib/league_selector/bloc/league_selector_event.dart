part of 'league_selector_bloc.dart';

sealed class LeagueSelectorEvent extends Equatable {
  const LeagueSelectorEvent();

  @override
  List<Object?> get props => [];
}

class LeagueSelectorLeaguesRequested extends LeagueSelectorEvent {
  const LeagueSelectorLeaguesRequested();
}

class LeagueSelectorLeagueSelected extends LeagueSelectorEvent {
  const LeagueSelectorLeagueSelected({required this.selectedLeague});

  final League? selectedLeague;

  @override
  List<Object?> get props => [selectedLeague];
}
