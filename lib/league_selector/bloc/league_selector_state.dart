part of 'league_selector_bloc.dart';

enum LeagueSelectorStatus {
  loading,
  success,
  error,
}

class LeagueSelectorState extends Equatable {
  const LeagueSelectorState._({
    this.status = LeagueSelectorStatus.loading,
    this.activeLeague,
    this.leagues = const [],
  });

  const LeagueSelectorState.loading() : this._();

  final LeagueSelectorStatus status;
  final League? activeLeague;
  final List<League> leagues;

  @override
  List<Object?> get props => [status, activeLeague, leagues];

  LeagueSelectorState copyWith({
    LeagueSelectorStatus? status,
    League? activeLeague,
    List<League>? leagues,
  }) {
    return LeagueSelectorState._(
      status: status ?? this.status,
      activeLeague: activeLeague ?? this.activeLeague,
      leagues: leagues ?? this.leagues,
    );
  }
}
