import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'league_event.dart';
part 'league_state.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  LeagueBloc() : super(LeagueLoading()) {
    on<LeagueFetch>((event, emit) async {
      emit(LeagueLoading());
      await Future.delayed(Duration(seconds: 5));
      emit(LeagueLoaded(detail: "Details of league ${event.leagueName}"));
    });
  }
}
