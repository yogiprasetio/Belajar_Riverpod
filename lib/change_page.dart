import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncrementNotifier extends ChangeNotifier{
  int _value = 0;
  int get value => _value;

  void increment(){
    _value +=1;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

class ChangePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nomor = ref.watch(incrementProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(nomor.value.toString())
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(incrementProvider).increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
