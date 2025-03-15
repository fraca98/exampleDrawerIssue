import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:league_repository/league_repository.dart';

part 'league_selector_event.dart';
part 'league_selector_state.dart';

class LeagueSelectorBloc
    extends Bloc<LeagueSelectorEvent, LeagueSelectorState> {
  LeagueSelectorBloc({required LeagueRepository leagueRepository})
      : _leagueRepository = leagueRepository,
        super(const LeagueSelectorState.loading()) {
    on<LeagueSelectorLeaguesRequested>(_onLeaguesRequested);
    on<LeagueSelectorLeagueSelected>(_onLeagueSelected);
  }

  final LeagueRepository _leagueRepository;

  Future<void> _onLeaguesRequested(
    LeagueSelectorLeaguesRequested event,
    Emitter<LeagueSelectorState> emit,
  ) {
    emit(const LeagueSelectorState.loading());
    return Future.wait(
      [
        emit.forEach(
          _leagueRepository.leagues,
          onData: (leagues) => state.copyWith(
            leagues: leagues,
            status: LeagueSelectorStatus.success,
          ),
          onError: (_, __) =>
              state.copyWith(status: LeagueSelectorStatus.error),
        ),
        emit.forEach(
          _leagueRepository.league,
          onData: (league) => state.copyWith(activeLeague: league),
        ),
      ],
    );
  }

  void _onLeagueSelected(
    LeagueSelectorLeagueSelected event,
    Emitter<LeagueSelectorState> emit,
  ) {
    _leagueRepository.activeLeague = event.selectedLeague;
  }
}
