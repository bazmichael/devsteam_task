import 'package:devsteam/pages/home_page.dart';
import 'package:devsteam/providers/images_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ImagesProvider(),
    )
  ], child: MyApp()));
}
