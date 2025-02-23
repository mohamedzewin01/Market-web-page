import 'package:flutter/material.dart';

import '../../features/products/presentation/pages/products_screen.dart';


class RoutesManager {
  static const String productsScreen = '/';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.productsScreen:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
