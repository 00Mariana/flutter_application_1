import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

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
  List<Map<String, dynamic>> productos = [];
  List<int> counters = [];

  @override
  void initState() {
    super.initState();
    _loadProductos();
  }

  Future<void> _loadProductos() async {
    String jsonString = await rootBundle.loadString('assets/productos.json');
    Map<String, dynamic> data = jsonDecode(jsonString);

    List<dynamic> jsonResponse = data['productos'];
    setState(() {
      productos = jsonResponse.cast<Map<String, dynamic>>();
      counters = List.filled(productos.length, 0);
    });
     
  }
  void _increment (int index){
    setState(() => counters[index]++);
  }

  void _decrement(int index){
    setState(() => counters[index] = counters[index] > 0 ? counters[index] - 1 : 0);
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
                        Image.asset('assets/${productos[1]['imagen']}', width: 100, height: 100),
                        Text('${productos[1]['producto']}'),
                        Text('${productos[1]['precio']}'),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                _increment(1);
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar 1'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                _decrement(1);
                              },
                              icon: const Icon(Icons.remove),
                              label: const Text('Quitar 1'),
                            ),
                          ],
                        ),
                        Text(
                          'comprar ',
                          style: TextStyle(color: Colors.brown),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        Image.asset('assets/${productos[2]['imagen']}', width: 100, height: 100),
                        Text('${productos[2]['producto']}'),
                        Text('${productos[2]['precio']}'),
        
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _increment(1),
                              icon: const Icon(Icons.add),
                              label: const Text('Agregar 1'),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _decrement(1),
                              label: const Text('Quitar 1'),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Text('comprar '),
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
                        Image.asset('assets/${productos[0]['imagen']}', width: 100, height: 100),
                        Text('${productos[0]['producto']}'),
                        Text('${productos[0]['precio']}'),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _increment(0),
                              label: const Text('Agregar 1'),
                              icon: const Icon(Icons.add),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _decrement(0),
                              label: const Text('Quitar 1'),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Text('comprar '),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      children: [
                        Image.asset('assets/${productos[3]['imagen']}', width: 100, height: 100),
                        Text('${productos[3]['producto']}'),
                        Text('${productos[3]['precio']}'),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => _increment(1),
                              label: const Text('Agregar 1'),
                              icon: const Icon(Icons.add),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => _decrement(1),
                              label: const Text('Quitar 1'),
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                        Text('comprar '),
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