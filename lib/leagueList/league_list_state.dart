part of 'league_list_bloc.dart';

@immutable
sealed class LeagueListState extends Equatable {
  @override
  List<Object> get props => [];
}

final class LeagueListLoading extends LeagueListState {}

final class LeagueListLoaded extends LeagueListState {
  final List<String> leagueNames;
  final String selectedLeaugue;

  LeagueListLoaded({required this.leagueNames, required this.selectedLeaugue});

  @override
  List<Object> get props => [leagueNames, selectedLeaugue];
}
