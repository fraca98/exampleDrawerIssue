part of 'league_bloc.dart';

sealed class LeagueState extends Equatable {
  const LeagueState();

  @override
  List<Object> get props => [];
}

final class LeagueLoading extends LeagueState {}

final class LeagueLoaded extends LeagueState {
  final String detail;

  LeagueLoaded({required this.detail});

  @override
  List<Object> get props => [detail];
}
