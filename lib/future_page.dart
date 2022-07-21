import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<int> getCuaca() async {
  await Future.delayed(Duration(seconds: 2));
  return 29;
}

final futureProvider = FutureProvider<int>((ref) => getCuaca());

class FuturePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cuaca = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: cuaca.when(
              data: (data) => Text(data.toString()), ///data adalah pengaliasan dari isi data cuaca.
              error: (e, s) => Text('$e'), ///e adalah error, s adalah pengaliasan.
              loading: () => CircularProgressIndicator())),
    );
  }
}
