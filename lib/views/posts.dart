import 'package:flutter/material.dart';
import 'package:post_comments/components/PostComponent.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 13, right: 10, bottom: 20),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/user.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 7, bottom: 7),
                        child: Text("Nouvelle publication"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    PostComponent(tableauImages: [], userProfileImage: "assets/images/user.png"),
                    PostComponent(tableauImages: [], userProfileImage: "assets/images/user.png",)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
