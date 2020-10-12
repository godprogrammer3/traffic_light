import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:traffic_light/app/locator.dart';
import 'package:traffic_light/app/router.gr.dart';
import 'package:traffic_light/datamodel/user.dart';
import 'package:traffic_light/services/authentication_service.dart';

class SplashViewModel extends FutureViewModel<void> {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  Future<void> startupLogic() async {
    await Future.delayed(const Duration(seconds: 2));
    if (_authenticationService.currentUser != null) {
      await _navigationService.replaceWith(Routes.homeView,
          arguments: User.fromFirebaseUser(_authenticationService.currentUser));
    } else {
      await _navigationService.replaceWith(Routes.loginView);
    }
  }

  @override
  Future<void> futureToRun() => startupLogic();
}
