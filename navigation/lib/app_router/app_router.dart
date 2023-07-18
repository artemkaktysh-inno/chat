import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: HomeScreen,
      children: <AutoRoute>[],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
