import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_comments/components/add/change_color.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  /*File? _image;
  Future getImageFromGalery() async{
    try{
      final image = await ImagePicker().pickMultiImage();
      final imageTemporary = File(image.first.path);

      setState(() {
        _image = imageTemporary;
      });
    }on PlatformException catch (e){
      print("Error: $e");
    }
  }

  Future getImageFromCamera() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e){
      print("Error: $e");
    }
  }*/

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
              Container(
                height: 300,
                color: Colors.deepOrangeAccent,
                child: const TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.white,
                  cursorHeight: 35,
                  cursorWidth: 3,
                  decoration: InputDecoration(
                    hintText: 'Start typing...',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const Divider(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                        const Spacer(),
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context){
                              return  const ChangeColor();
                            });
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.color_lens_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
 Center(
            child: Column(
              children: [
                _image != null ? Image.file(_image!, width: 250, height: 250, fit: BoxFit.cover,) : Image.network("https://picsum.photos/250?image=9"),
                InkWell(
                onTap: (){
                  getImageFromGalery();
                },
                child: const Text("Galery")),
                InkWell(
                  onTap: (){
                    getImageFromCamera();
                  },
                    child: Text("Camera")),
              ],
            ),
          ),
 */
