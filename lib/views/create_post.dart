import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  File? _image;
  Future getImageFromGalery() async{
    try{
      final image = await ImagePicker().pickMultiImage();
      if(image == null) return;
      final imageTemporary = File(image.first.path);

      setState(() {
        this._image = imageTemporary;
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
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
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
    );
  }
}
