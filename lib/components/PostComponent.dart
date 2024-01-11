import 'package:flutter/material.dart';

class PostComponent extends StatefulWidget {
  final List<String> tableauImages;
  final String userProfileImage;
  const PostComponent(
      {super.key, required this.tableauImages, required this.userProfileImage});

  @override
  State<PostComponent> createState() => _PostComponentState();

}

class _PostComponentState extends State<PostComponent> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.asset(
                  widget.userProfileImage,
                  height: 45,
                  width: 45,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vituixo",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "3h",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text("Description de mon poste"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/S7-modele--toyota-c-hr.jpg',
                  fit: BoxFit.cover,
                   height: 300, // Vous pouvez retirer cela pour une hauteur dynamique
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/images.jpeg',
                      fit: BoxFit.cover,
                      height: 149,
                    ),
                    const SizedBox(height: 2),
                    Image.asset(
                      'assets/images/images.jpeg',
                      fit: BoxFit.cover,
                      height: 149,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
