import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/model/product_model.dart';
import 'package:flutter_riverpod_example/pages/provider_example/product_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productProvider = StateNotifierProvider<ProductNotifier, List<Product>>(
  (ref) {
    return ProductNotifier(const [
      Product(
          id: '1',
          title: '葡萄',
          description: '最新鲜的葡萄',
          price: 12.3,
          salesVolume: 3434),
      Product(
          id: '2',
          title: '橘子',
          description: '最新鲜的橘子',
          price: 2.1,
          salesVolume: 100),
      Product(
          id: '3',
          title: '芒果',
          description: '最新鲜的芒果',
          price: 23.3,
          salesVolume: 44),
      Product(
          id: '4',
          title: '苹果',
          description: '最新鲜的苹果',
          price: 19.8,
          salesVolume: 55),
      Product(
          id: '5',
          title: '柚子',
          description: '最新鲜的柚子',
          price: 21.0,
          salesVolume: 12),
      Product(
          id: '6',
          title: '西红柿',
          description: '最新鲜的西红柿',
          price: 7.6,
          salesVolume: 442),
      Product(
          id: '7',
          title: '玫瑰酒',
          description: '最新鲜的玫瑰酒',
          price: 7.3,
          salesVolume: 12),
      Product(
          id: '8',
          title: '山楂',
          description: '最新鲜的山楂',
          price: 1.3,
          salesVolume: 23),
    ]);
  },
);

final selecteProduct = StateProvider<String?>(
  (ref) => null,
);


class ProviderExample extends ConsumerWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> productList = ref.watch(productProvider);
    String? selectedId = ref.watch(selecteProduct);
    return Scaffold(
        appBar: AppBar(title: const Text('ProviderExample')),
        body: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (_, index) {
              Product product = productList[index];
              return GestureDetector(
                onTap: () => ref.read(selecteProduct.notifier).state = product.id,
                child: ListTile(
                  title: Text(product.title),
                  selected: selectedId == product.id,
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.description),
                      Text(product.salesVolume.toString())
                    ],
                  ),
                ),
              );
            }));
  }
}
