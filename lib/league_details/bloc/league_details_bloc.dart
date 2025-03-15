import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:league_repository/league_repository.dart';

part 'league_details_event.dart';
part 'league_details_state.dart';

class LeagueDetailsBloc extends Bloc<LeagueDetailsEvent, LeagueDetailsState> {
  LeagueDetailsBloc({required LeagueRepository leagueRepository})
      : _leagueRepository = leagueRepository,
        super(const LeagueDetailsLoadInProgress()) {
    on<LeagueDetailsLoadRequested>(_onLoadRequested);
  }

  final LeagueRepository _leagueRepository;

  Future<void> _onLoadRequested(
    LeagueDetailsLoadRequested event,
    Emitter<LeagueDetailsState> emit,
  ) {
    return emit.forEach(
      _leagueRepository.leagueDetails,
      onData: (details) => LeagueDetailsLoadSuccess(details: details),
      onError: (_, __) => const LeagueDetailsLoadFailure(),
    );
  }
}
