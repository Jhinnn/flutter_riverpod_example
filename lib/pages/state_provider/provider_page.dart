import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageIndexProvider = StateProvider<int>(
  (ref) => 1,
);

final canGoToPreviousPageProvider = Provider<bool>(
  (ref) => ref.watch(pageIndexProvider) != 1,
);

final canGoToNextPageProvider = Provider<bool>(
  (ref) => ref.watch(pageIndexProvider) != 13,
);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(pageIndexProvider);

    bool canGoToNextPage = ref.watch(canGoToNextPageProvider);
    bool canGoToPrevious = ref.watch(canGoToPreviousPageProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('StateProviderPage')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i in List.generate(13, (index) => index + 1))
                    InkWell(
                      onTap: () => ref
                          .read(pageIndexProvider.notifier)
                          .update((state) => state = i),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: index == i ? Colors.green : Colors.white,
                                border:
                                    Border.all(color: Colors.green, width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(i.toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: index == i
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              ))),
                    )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: canGoToPrevious,
                    child: OutlinedButton(
                        onPressed: () {
                          ref
                              .read(pageIndexProvider.notifier)
                              .update((state) => state - 1);
                        },
                        child: const Text('<上一页')),
                  ),
                  Visibility(
                      visible: canGoToNextPage,
                      child: OutlinedButton(
                          onPressed: () {
                            ref
                                .read(pageIndexProvider.notifier)
                                .update((state) => state + 1);
                          },
                          child: const Text('下一页>')))
                ],
              ),
            ],
          ),
        ));
  }
}
