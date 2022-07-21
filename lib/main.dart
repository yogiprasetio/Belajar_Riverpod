import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final helloProvider = Provider<String>((ref) => 'Hello Riverpod');
final nomorStateProvider = StateProvider<int>((ref) => 0);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final halo = ref.watch(helloProvider);
    final nomor = ref.watch(nomorStateProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Belajar Riverpod'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(halo),
          Text(nomor.toString())
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(nomorStateProvider.state).state++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
