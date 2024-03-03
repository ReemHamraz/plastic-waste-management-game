import 'package:plasticdive/app/app.locator.dart';
import 'package:plasticdive/app/app.router.dart';
import 'package:plasticdive/services/diver_upgrade_service.dart';
import 'package:plasticdive/services/shared_preferences_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _sharedPreferencesService = locator<SharedPreferencesService>();
  final _diverUpgradeService = locator<DiverUpgradeService>();

  bool get isDiverUpgradable => _diverUpgradeService.isDiverUpgradable;

  bool get isSoundEnabled => _sharedPreferencesService.isSoundEnabled;

  int get points => _sharedPreferencesService.points;

  Future switchSound() async {
    await _sharedPreferencesService.toggleSoundEnabled();
    rebuildUi();
  }

  Future navigateToGame() async {
    if (!_sharedPreferencesService.hasSeenHowToPlay) {
      return await _routerService.navigateToHowToPlayView(goToGameOnComplete: true);
    }

    await _routerService.navigateToGameView();
    rebuildUi();
  }

  Future navigateToHowToPlay() async {
    return await _routerService.navigateToHowToPlayView(goToGameOnComplete: false);
  }

  Future navigateToSettings() async {
    await _routerService.navigateToSettingsView();
    rebuildUi(); // Make sure the sound icon is updated
  }

  Future navigateToAbout() async {
    return await _routerService.navigateToAboutView();
  }

  Future navigateToInfocean() async {
    return await _routerService.navigateToInfoceanView();
  }

  Future navigateToLeaderboard() async {
    return await _routerService.navigateToLeaderboardView();
  }

  Future navigateToLevelUpDiver() async {
    await _routerService.navigateToLevelUpDiverView();
    rebuildUi();
  }

  void refreshPoints() {
    rebuildUi();
  }
}
