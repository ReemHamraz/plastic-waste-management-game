import 'package:plasticdiver/app/app.locator.dart';
import 'package:plasticdiver/app/app.router.dart';
import 'package:plasticdiver/services/diver_upgrade_service.dart';
import 'package:plasticdiver/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AfterGameViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _diverUpgradeService = locator<DiverUpgradeService>();

  bool get isDiverUpgradable => _diverUpgradeService.isDiverUpgradable;

  int get highScore => _sharedPreferencesService.highScore;

  int get points => _sharedPreferencesService.points;

  Future replay() async {
    await _routerService.replaceWithGameView();
  }

  Future navigateToHome() async {
    await _routerService.replaceWithHomeView();
  }

  Future navigateToLeaderboard() async {
    await _routerService.replaceWithLeaderboardView();
  }

  Future navigateToLevelUpDiver() async {
    await _routerService.replaceWithLevelUpDiverView();
  }
}
