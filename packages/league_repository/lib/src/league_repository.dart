import 'dart:async';

typedef League = String;
typedef LeagueDetails = String;

class LeagueRepository {
  League? _activeLeague;
  League? get activeLeague => _activeLeague;
  set activeLeague(League? league) {
    _activeLeague = league;
    _activeLeagueController.add(league);
  }

  List<League> _allLeagues = [];
  List<League> get allLeagues => _allLeagues;
  set allLeagues(List<League> leagues) {
    _allLeagues = leagues;
    _leaguesController.add(leagues);
    activeLeague ??= _allLeagues.first;
  }

  final StreamController<League?> _activeLeagueController =
      StreamController.broadcast();

  final StreamController<List<League>> _leaguesController =
      StreamController.broadcast();

  Future<void> fetchLeagues() async {
    await Future<void>.delayed(const Duration(seconds: 1)); // artificial delay
    allLeagues = ['League 1', 'League 2', 'League 3'];
  }

  Stream<League?> get league async* {
    yield activeLeague;
    yield* _activeLeagueController.stream;
  }

  Stream<List<League>> get leagues async* {
    yield allLeagues;
    yield* _leaguesController.stream;
  }

  Stream<LeagueDetails?> get leagueDetails {
    return _activeLeagueController.stream.asyncMap((league) async {
      if (league == null) return null;
      return '$league Details';
    });
  }

  void close() {
    _activeLeagueController.close();
    _leaguesController.close();
  }
}
