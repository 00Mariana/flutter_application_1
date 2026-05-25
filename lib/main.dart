import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app de helados',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'IceCream Polar Bear'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counterAgua = 0;
  int _counterChocolate = 0;
  int _counterHelados = 0;
  int _counterCrema = 0;

  void _incrementCounterAgua() {
    setState(() {
      _counterAgua++;
    });
  }

  void _decrementCounterAgua() {
    setState(() {
      _counterAgua--;
    });
  }

  void _incrementCounterChocolate() {
    setState(() {
      _counterChocolate++;
    });
  }

  void _decrementCounterChocolate() {
    setState(() {
      _counterChocolate--;
    });
  }

  void _incrementCounterHelados() {
    setState(() {
      _counterHelados++;
    });
  }

  void _decrementCounterHelados() {
    setState(() {
      _counterHelados--;
    });
  }

  void _incrementCounterCrema() {
    setState(() {
      _counterCrema++;
    });
  }

  void _decrementCounterCrema() {
    setState(() {
      _counterCrema--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 150, height: 150),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/agua.png', width: 100, height: 100),
                        Text('Agregar/Quitar Aguas'),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _incrementCounterAgua();
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar 1'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _decrementCounterAgua();
                              },
                              icon: const Icon(Icons.remove),
                              label: const Text('Quitar 1'),
                            ),
                          ],
                        ),
                        Text(
                          'comprar $_counterAgua',
                          style: TextStyle(color: Colors.brown),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        Image.asset(
                          'assets/chocolate.png',
                          width: 100,
                          height: 100,
                        ),
                        Text('Agregar/quitar chocolate'),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: _incrementCounterChocolate,
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar 1'),
                            ),
                            ElevatedButton.icon(
                              onPressed: _decrementCounterChocolate,
                              label: const Text('Quitar 1'),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Text('comprar $_counterChocolate'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //! Columna de crema y helados
                    Column(
                      children: [
                        Image.asset(
                          'assets/crema.png',
                          width: 100,
                          height: 100,
                        ),
                        Text('Agregar/Quitar crema'),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: _incrementCounterCrema,
                              label: const Text('Agregar 1'),
                              icon: const Icon(Icons.add),
                            ),
                            ElevatedButton.icon(
                              onPressed: _decrementCounterCrema,
                              label: const Text('Quitar 1'),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Text('comprar $_counterCrema'),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Image.asset(
                          'assets/helados.png',
                          width: 100,
                          height: 100,
                        ),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: _incrementCounterHelados,
                              label: const Text('Agregar 1'),
                              icon: const Icon(Icons.add),
                            ),
                            ElevatedButton.icon(
                              onPressed: _decrementCounterHelados,
                              label: const Text('Quitar 1'),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Text('comprar $_counterHelados'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}