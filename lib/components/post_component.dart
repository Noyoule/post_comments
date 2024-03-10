import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:post_comments/components/description_component.dart';
import 'package:post_comments/components/image_logic.dart';
import 'package:post_comments/views/images_view.dart';
import 'package:share/share.dart';

class PostComponent extends StatefulWidget {
  final List<String> tableauImages;
  final String userProfileImage;
  final String description;
  const PostComponent(
      {super.key, required this.tableauImages, required this.userProfileImage, required this.description});

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  late bool hasImage;
  @override
  void initState() {
    super.initState();
    hasImage = (widget.tableauImages.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 4),
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
                ClipOval(
                  child: Image.asset(
                    widget.userProfileImage,
                    height: 45,
                    width: 45,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vituixo",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Merriweather",
                      ),
                    ),
                    Text(
                      "3h",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: "Merriweather",
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 3,),
          //Description
          DescriptionComponent(
              text: widget.description,
              hasImage: hasImage),
          //Afficher les images
          hasImage
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        _customPageRoute(ImagesSlider(
                          tableauImages: widget.tableauImages,
                        )));
                  },
                  child: ImageLogic(tableauImages: widget.tableauImages),
                )
              : const SizedBox(),
          const SizedBox(
            height: 2,
          ),
          //Afficher le nombre de like
          Row(
            children: [
              Image.asset(
                "assets/images/like.png",
                height: 18,
                width: 18,
              ),
              const SizedBox(
                width: 2,
              ),
              const Text(
                "8",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 1,
          ),
          const Divider(),
          const SizedBox(
            height: 2,
          ),
          //Afficher les boutton de like, commentaire et de partage
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.string(
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"> <path stroke-linecap="round" stroke-linejoin="round" d="M6.633 10.5c.806 0 1.533-.446 2.031-1.08a9.041 9.041 0 012.861-2.4c.723-.384 1.35-.956 1.653-1.715a4.498 4.498 0 00.322-1.672V3a.75.75 0 01.75-.75A2.25 2.25 0 0116.5 4.5c0 1.152-.26 2.243-.723 3.218-.266.558.107 1.282.725 1.282h3.126c1.026 0 1.945.694 2.054 1.715.045.422.068.85.068 1.285a11.95 11.95 0 01-2.649 7.521c-.388.482-.987.729-1.605.729H13.48c-.483 0-.964-.078-1.423-.23l-3.114-1.04a4.501 4.501 0 00-1.423-.23H5.904M14.25 9h2.25M5.904 18.75c.083.205.173.405.27.602.197.4-.078.898-.523.898h-.908c-.889 0-1.713-.518-1.972-1.368a12 12 0 01-.521-3.507c0-1.553.295-3.036.831-4.398C3.387 10.203 4.167 9.75 5 9.75h1.053c.472 0 .745.556.5.96a8.958 8.958 0 00-1.302 4.665c0 1.194.232 2.333.654 3.375z" /></svg>',
                color: const Color.fromARGB(255, 110, 110, 110),
              ),
              const Spacer(),
              SvgPicture.string(
                '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"> <path stroke-linecap="round" stroke-linejoin="round" d="M8.625 12a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375M21 12c0 4.556-4.03 8.25-9 8.25a9.764 9.764 0 01-2.555-.337A5.972 5.972 0 015.41 20.97a5.969 5.969 0 01-.474-.065 4.48 4.48 0 00.978-2.025c.09-.457-.133-.901-.467-1.226C3.93 16.178 3 14.189 3 12c0-4.556 4.03-8.25 9-8.25s9 3.694 9 8.25z" /></svg>',
                color: const Color.fromARGB(255, 110, 110, 110),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Share.share(
                    'check out my website https://example.com',
                    subject: 'Look what I made!'),
                child: SvgPicture.string(
                  '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" d="M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z" /></svg>',
                  color: const Color.fromARGB(255, 110, 110, 110),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

PageRouteBuilder _customPageRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
