import 'dart:io';

import 'package:flutter/material.dart';

class CreatePostPreviewImageLogic extends StatelessWidget {
  final List<File> tableauImages;
  const CreatePostPreviewImageLogic({Key? key, required this.tableauImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if (tableauImages.length == 1) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
              child: Image.file(
                tableauImages[0],
                width: screenSize.width,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      );
    } else if (tableauImages.length == 2) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.file(
                tableauImages[0],
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Expanded(
              child: Image.file(
                tableauImages[1],
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
          ],
        ),
      );
    } else if (tableauImages.length == 3) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.file(
                tableauImages[0], fit: BoxFit.cover,
                height:
                300, // Vous pouvez retirer cela pour une hauteur dynamique
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.file(
                        tableauImages[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Image.file(
                        tableauImages[2],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else if (tableauImages.length > 3) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.file(
                tableauImages[0],
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.file(
                        tableauImages[1],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Expanded(
                      child: Stack(
                        children: [
                          Image.file(
                            tableauImages[2],
                            fit: BoxFit.cover,
                            height: 150,
                            width: 100,
                          ),
                          Container(
                            color: const Color.fromRGBO(0, 0, 0, 0.47),
                            child: Center(
                              child: Text(
                                '+${tableauImages.length - 3}',
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox(
      height: 0,
      width: 0,
    );
  }
}
