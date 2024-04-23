import 'dart:io';

import 'package:flutter/material.dart';

class ShowOnImage extends StatelessWidget {
  final File file;
  const ShowOnImage({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Image.file(file),
      ),
    );
  }
}
