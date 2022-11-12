import 'package:flutter_riverpod_example/pages/provider_example/provider_example.dart';
import 'package:flutter_riverpod_example/pages/state_notifier_provider/state_notifier_provider_page.dart';
import 'package:flutter_riverpod_example/pages/state_provider/provider_page.dart';
import 'package:flutter_riverpod_example/routes/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
        name: AppRoutes.StateNotifierProvider,
        page: () => const StateNotifierProviderPage()),
    GetPage(
        name: AppRoutes.StateProvider, page: () => const StateProviderPage()),
    GetPage(
        name: AppRoutes.StateProviderExample,
        page: () => const ProviderExample())
  ];
}
