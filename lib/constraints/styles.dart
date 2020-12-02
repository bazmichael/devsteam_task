
import 'package:flutter/material.dart';

const unsplash24 = TextStyle(
  fontFamily: 'Nerko',
  fontSize: 24
);

const unsplash28 = TextStyle(
    fontFamily: 'Nerko',
    fontSize: 28
);

abstract class Strings {
  static final appTitle = 'Unsplash photo gallery';
  static final idleDescription = 'No description provided';
  static final unknown = 'Unknown';
  static authorInfo(String author) => 'Author: $author';
}