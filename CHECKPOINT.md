# CHECKPOINT — Don't delete this file

## Goal
Load products from `assets/productos.json` into the app instead of hardcoding them.

## What's done ✅
- `productos.json` moved into `assets/` folder
- Added imports in `main.dart`:
  - `import 'dart:convert';`
  - `import 'package:flutter/services.dart';`
- Added variables inside `_MyHomePageState`:
  - `List<Map<String, dynamic>> productos = [];`
  - `List<int> counters = [];`
- Added `initState()` that calls `_loadProductos()`
- Added `_loadProductos()` with lines 47-48:
  - Reads JSON string from assets
  - Parses it into a Map via `jsonDecode`

## What's next 🔜
Inside `_loadProductos()`, after line 48, add:

1. Extract the list from the map:
   ```dart
   List<dynamic> jsonResponse = data['productos'] as List<dynamic>;
   ```

2. Save it with setState:
   ```dart
   setState(() {
     productos = jsonResponse;
     counters = List.filled(productos.length, 0);
   });
   ```

3. Rewrite the `build()` method to loop over `productos` and generate the UI dynamically instead of the hardcoded 4 product rows.

## Current file state
`lib/main.dart` has:
- Lines 1-4: imports
- Lines 5-21: MyApp widget
- Lines 23-30: MyHomePage widget
- Lines 32-242: _MyHomePageState (contains hardcoded counters + JSON loading code + build method)
