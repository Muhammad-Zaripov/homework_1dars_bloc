import 'package:flutter/material.dart';

import 'app/main_app.dart';
import 'core/di/dpi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dp();
  runApp(const MainApp());
}
