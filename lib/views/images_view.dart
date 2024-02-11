import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  final List<String> tableauImages;
  const ImagesSlider({super.key, required this.tableauImages});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: tableauImages.map((i) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
            12.0), // ajustez la valeur selon vos préférences
                              child: Image.asset(
                                i,
                                width: screenSize.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
            )),
      ),
    );
  }
}
