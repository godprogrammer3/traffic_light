// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/add_intersection/add_intersection_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/login/login_view.dart';
import '../ui/views/normal_intersection/normal_intersection_view.dart';
import '../ui/views/rename_intersection/rename_intersection_view.dart';
import '../ui/views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String addIntersectionView = '/add-intersection-view';
  static const String normalIntersectionView = '/normal-intersection-view';
  static const String renameIntersectionView = '/rename-intersection-view';
  static const all = <String>{
    splashView,
    loginView,
    homeView,
    addIntersectionView,
    normalIntersectionView,
    renameIntersectionView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.addIntersectionView, page: AddIntersectionView),
    RouteDef(Routes.normalIntersectionView, page: NormalIntersectionView),
    RouteDef(Routes.renameIntersectionView, page: RenameIntersectionView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    AddIntersectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddIntersectionView(),
        settings: data,
      );
    },
    NormalIntersectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NormalIntersectionView(),
        settings: data,
      );
    },
    RenameIntersectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RenameIntersectionView(),
        settings: data,
      );
    },
  };
}
