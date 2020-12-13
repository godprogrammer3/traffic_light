import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:traffic_light/ui/views/add_intersection/add_intersection_view.dart';
import 'package:traffic_light/ui/views/home/home_view.dart';
import 'package:traffic_light/ui/views/login/login_view.dart';
import 'package:traffic_light/ui/views/normal_intersection/normal_intersection_view.dart';
import 'package:traffic_light/ui/views/splash/splash_view.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: AddIntersectionView),
  MaterialRoute(page: NormalIntersectionView)
])
class $Router {}
