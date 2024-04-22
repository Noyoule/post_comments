import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_comments/components/add/change_color.dart';
import 'package:post_comments/components/create_post_preview_image_logic.dart';
import 'package:post_comments/cubit/add/color_cubit.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  List<File> _imageTable = [];
  Future getImageFromGallery() async {
    try {
      final images = await ImagePicker().pickMultiImage();
      List<File> temporaryTable = _imageTable;
      for (var element in images) {
        temporaryTable.add(File(element.path));
      }
      setState(() {
        _imageTable = temporaryTable;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Error: $e");
      }
    }
  }

  Future getImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      List<File> temporaryTable = _imageTable;
      temporaryTable.add(File(image.path));

      setState(() {
        _imageTable = temporaryTable;
      });
    } on PlatformException catch (e) {
      print("Error: $e");
    }
  }

  Color inverseColor(Color color) {
    int inverseRed = 255 - color.red;
    int inverseGreen = 255 - color.green;
    int inverseBlue = 255 - color.blue;
    if (115 <= inverseBlue &&
        inverseBlue <= 130 &&
        115 <= inverseGreen &&
        inverseGreen <= 130 &&
        115 <= inverseRed &&
        inverseRed <= 130) {
      return Colors.white;
    }
    return Color.fromARGB(color.alpha, inverseRed, inverseGreen, inverseBlue);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Créer un post",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              "Publiée",
              style: GoogleFonts.lato(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Divider(
                height: 2,
              ),
              const Gap(10),
              Row(
                children: [
                  const Gap(10),
                  ClipOval(
                    child: Image.asset(
                      "assets/images/images.jpeg",
                      height: 45,
                      width: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Vituixo",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Merriweather",
                    ),
                  ),
                ],
              ),
              const Gap(10),
              _imageTable.isEmpty
                  ? BlocBuilder<ColorCubit, int>(builder: (context, state) {
                      return Container(
                        height: 300,
                        color: Color(state),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          expands: true,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                              color: inverseColor(Color(state)),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          cursorColor: inverseColor(Color(state)),
                          cursorHeight: 35,
                          cursorWidth: 3,
                          decoration: InputDecoration(
                            hintText: 'Start typing...',
                            hintStyle:
                                TextStyle(color: inverseColor(Color(state))),
                          ),
                        ),
                      );
                    })
                  : Container(
                padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 3,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Inscrivez votre description",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                                fontSize: 15
                              )
                            ),
                          ),
                          CreatePostPreviewImageLogic(
                            tableauImages: _imageTable,
                          ),
                        ],
                      ))
            ],
          ),
          _imageTable.isEmpty
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: KeyboardVisibilityBuilder(
                      builder: (BuildContext context, isKeyboardVisible) {
                    return isKeyboardVisible
                        ? ChangeColor(
                            isKeyboardVisible: true,
                          )
                        : Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                const Divider(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.font_download_outlined,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      _imageTable.isEmpty
                                          ? const Spacer()
                                          : const SizedBox(),
                                      _imageTable.isEmpty
                                          ? InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return ChangeColor();
                                                    });
                                              },
                                              child: Container(
                                                width: 45,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.color_lens_outlined,
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          getImageFromGallery();
                                        },
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.image_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          getImageFromCamera();
                                        },
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: const Center(
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  }))
              : const SizedBox(),
        ],
      ),
      floatingActionButton: _imageTable.isNotEmpty
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              tooltip: "Add an image",
              mini: true,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
