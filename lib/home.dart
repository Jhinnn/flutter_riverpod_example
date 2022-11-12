import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/main.dart';
import 'package:flutter_riverpod_example/routes/app_routes.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('river_pod'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, ref, child) {
             
              return MyWidget(
                  voidCallback: () {

                    Get.toNamed(AppRoutes.StateNotifierProvider);
                  },
                  title: 'state_notifier_provider_page');
            }),
            MyWidget(
                voidCallback: () {
                  Get.toNamed(AppRoutes.StateProvider);
                },
                title: 'state_provider_example'),
            Consumer(builder: (context, ref, child) {
              return MyWidget(
                  voidCallback: () {

                   

                    Get.toNamed(AppRoutes.StateProviderExample);
                  },
                  title: 'state_notifier_provider_example_page');
            }),
          ],
        ),
      ),
    );
  }
}
