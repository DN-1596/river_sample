import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_sample/data_source/isar_db/isar_db.dart';
import 'package:river_sample/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  IsarDB().openDB().then(
    (_) {
      runApp(
        const ProviderScope(
          child: MaterialApp(
            home: MyApp(),
          ),
        ),
      );
    },
  );
}
