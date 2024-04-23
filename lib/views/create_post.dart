import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:floating_action_bubble_custom/floating_action_bubble_custom.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_comments/components/add/change_font.dart';
import 'package:post_comments/components/custom_font.dart';
import 'package:post_comments/components/add/change_color.dart';
import 'package:post_comments/components/add/create_post_preview_image_logic.dart';
import 'package:post_comments/components/add/showOnImage.dart';
import 'package:post_comments/cubit/add/color_cubit.dart';
import 'package:post_comments/cubit/add/font_cubit.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost>
    with SingleTickerProviderStateMixin {
  List<File> _imageTable = [];
  late Animation<double> _animation;
  late AnimationController _animationController;
  late bool isClosed;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    isClosed = true;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
    _controller = TextEditingController(
      text: "",
    );
    final curvedAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _animationController,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

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
      if (kDebugMode) {
        print("Error: $e");
      }
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
                    ? BlocBuilder<ColorCubit, int>(
                        builder: (context, colorState) {
                        return BlocBuilder<FontCubit, String>(
                            builder: (BuildContext context, fontState) {
                          return Container(
                            height: 300,
                            color: Color(colorState),
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              expands: true,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              style: CustomFont.getFont(
                                  font: fontState,
                                  color: inverseColor(Color(colorState)),
                                  size: 20),
                              cursorColor: inverseColor(Color(colorState)),
                              cursorHeight: 35,
                              cursorWidth: 3,
                              decoration: InputDecoration(
                                hintText: 'Start typing...',
                                hintStyle: CustomFont.getFont(
                                    font: fontState,
                                    color: inverseColor(Color(colorState)),
                                    size: 20),
                              ),
                            ),
                          );
                        });
                      })
                    : Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _controller,
                              maxLines: 2,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Inscrivez votre description",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 15)),
                            ),
                            Container(
                              constraints: BoxConstraints(
                                  maxHeight:
                                      MediaQuery.of(context).size.height / 2),
                              child: CreatePostPreviewImageLogic(
                                tableauImages: _imageTable,
                              ),
                            )
                          ],
                        )),
                const Spacer(),
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 100,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _imageTable
                            .expand((e) => [
                                  Stack(
                                    children: [
                                      Image.file(
                                        e,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                          top: 1,
                                          right: 1,
                                          child: InkWell(
                                            onTap: () {
                                              _imageTable.remove(e);
                                              setState(() {
                                                _imageTable;
                                              });
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                          )),
                                      Positioned(
                                          top: 1,
                                          left: 1,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                      pageBuilder:
                                                          (_, __, ___) =>
                                                              ShowOnImage(
                                                                  file: e)));
                                            },
                                            child: const Icon(
                                              Icons.expand,
                                              color: Colors.blue,
                                            ),
                                          ))
                                    ],
                                  ),
                                  const Gap(10)
                                ])
                            .toList()),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
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
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return const ChangeFont();
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
                                                Icons.font_download_outlined,
                                                size: 30,
                                                color: Colors.white,
                                              ),
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
                                              color: Theme.of(context)
                                                  .primaryColor,
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
                                              color: Theme.of(context)
                                                  .primaryColor,
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
        //Init Floating Action Bubble
        floatingActionButton: _imageTable.isNotEmpty
            ? FloatingActionBubble(
                // animation controller
                animation: _animation,
                // On pressed change animation state
                onPressed: () {
                  _animationController.isCompleted
                      ? _animationController.reverse()
                      : _animationController.forward();
                  setState(() {
                    isClosed = !isClosed;
                  });
                },
                // Floating Action button Icon color
                iconColor:
                    isClosed ? Theme.of(context).primaryColor : Colors.white,
                // Flaoting Action button Icon
                iconData: isClosed ? Icons.add : Icons.close,
                backgroundColor:
                    isClosed ? Colors.white : Theme.of(context).primaryColor,
                // Menu items
                items: <Widget>[
                  // Floating action menu item
                  BubbleMenu(
                    title: 'Gallery',
                    iconColor: Colors.white,
                    bubbleColor: Theme.of(context).primaryColor,
                    icon: Icons.image_outlined,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                    onPressed: () {
                      _animationController.reverse();
                      getImageFromGallery();
                      setState(() {
                        isClosed = !isClosed;
                      });
                    },
                  ),
                  // Floating action menu item
                  BubbleMenu(
                    title: 'Camera',
                    iconColor: Colors.white,
                    bubbleColor: Theme.of(context).primaryColor,
                    icon: Icons.camera_alt_outlined,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                    onPressed: () {
                      _animationController.reverse();
                      getImageFromCamera();
                      setState(() {
                        isClosed = !isClosed;
                      });
                    },
                  ),
                ],
              )
            : null);
  }
}
