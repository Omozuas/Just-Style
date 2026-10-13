import 'package:flutter/material.dart';

ImageProvider homeImage(String path) {
  if (path.startsWith('http')) return NetworkImage(path);
  return AssetImage(path);
}
