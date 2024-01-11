import 'package:flutter/material.dart';

class ImageLogic extends StatelessWidget {
  final List<String> tableauImages;
  const ImageLogic({super.key, required this.tableauImages});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (tableauImages.length == 1) {
      return Row(
        children: [
          Image.asset(
            tableauImages[0],
            width: screenSize.width,
            fit: BoxFit.cover,
          )
        ],
      );
    } else if (tableauImages.length == 2) {
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              tableauImages[0],
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
            child: Image.asset(
              tableauImages[1],
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
        ],
      );
    }
    return const Placeholder();
  }
}
