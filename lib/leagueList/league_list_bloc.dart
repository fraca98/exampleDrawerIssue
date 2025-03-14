import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'league_list_event.dart';
part 'league_list_state.dart';

class LeagueListBloc extends Bloc<LeagueListEvent, LeagueListState> {
  LeagueListBloc() : super(LeagueListLoading()) {
    on<LeagueListFetch>((event, emit) async {
      await Future.delayed((Duration(seconds: 5)));
      emit(LeagueListLoaded(
          leagueNames: ["league1", "league2", "league3"],
          selectedLeaugue: "league1"));
    });
    on<LeagueListUpdateSelection>(
      (event, emit) {
        emit(LeagueListLoaded(
            leagueNames: (state as LeagueListLoaded).leagueNames,
            selectedLeaugue: event.newLeague));
      },
    );
  }
}
