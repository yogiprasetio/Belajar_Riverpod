import 'package:belajar_rivepod/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DetailUserPage extends ConsumerWidget {
  DetailUserPage({required this.id});
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(detailUserData(id));
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: user.when(
              data: (data) => Text(data.name), ///data adalah pengaliasan dari isi data cuaca.
              error: (e, s) => Text('$e'), ///e adalah error, s adalah pengaliasan.
              loading: () => CircularProgressIndicator())),
    );
  }
}
