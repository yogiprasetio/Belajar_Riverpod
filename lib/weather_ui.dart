import 'package:belajar_rivepod/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AirPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cuaca = ref.watch(airData);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: cuaca.when(
              data: (data) => Column(
                children: [///add a null check bcause the models using a null variable
                  Text(data.data!.city!),
                  Text(data.data!.country!),
                  Text(data.data!.current!.weather!.tp!.toString()+' Celc'),
                ],
              ), ///data adalah pengaliasan dari isi data cuaca.
              error: (e, s) => Text('$e'), ///e adalah error, s adalah pengaliasan.
              loading: () => CircularProgressIndicator())),
    );
  }
}
