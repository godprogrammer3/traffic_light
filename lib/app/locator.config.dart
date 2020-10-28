// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/authentication_service.dart';
import '../services/database_service.dart';
import '../services/intersection_service.dart';
import '../services/third_party_services_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModules = _$ThirdPartyServicesModules();
  gh.lazySingleton<AuthenticationService>(() => AuthenticationService());
  gh.lazySingleton<DatabaseService>(() => DatabaseService());
  gh.lazySingleton<DialogService>(
      () => thirdPartyServicesModules.dialogService);
  gh.lazySingleton<IntersectionService>(() => IntersectionService());
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModules.navigationService);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModules.snackBarService);
  return get;
}

class _$ThirdPartyServicesModules extends ThirdPartyServicesModules {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
