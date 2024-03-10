import 'package:flutter/material.dart';
import 'package:post_comments/components/post_component.dart';
import 'package:post_comments/views/create_post.dart';

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
                ClipOval(
                  child: Image.asset(
                    'assets/images/user.png',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const CreatePost()));
                      },
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: Text(
                            "Nouvelle publication",
                            style: TextStyle(
                                fontFamily: "Merriweather",
                                fontStyle: FontStyle.italic),
                          ),
                        ),
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
                    PostComponent(tableauImages: [
                      'assets/images/user.png',
                      'assets/images/maserati-granturismo-folgore-1.jpg',
                      'assets/images/S7-modele--toyota-c-hr.jpg',
                      'assets/images/S7-modele--toyota-c-hr.jpg',
                      'assets/images/S7-modele--toyota-c-hr.jpg'
                    ], userProfileImage: "assets/images/user.png",
                    description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",),
                    PostComponent(
                      tableauImages: [
                        'assets/images/user.png',
                        'assets/images/maserati-granturismo-folgore-1.jpg'
                      ],
                      userProfileImage: "assets/images/user.png",
                      description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                    ),
                    PostComponent(
                      tableauImages: [
                        'assets/images/maserati-granturismo-folgore-1.jpg'
                      ],
                      userProfileImage: "assets/images/user.png",
                      description: " Le text",
                    ),
                    PostComponent(
                      tableauImages: [

                      ],
                      userProfileImage: "assets/images/user.png",
                      description: "J'ai de la chance",
                    )
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
