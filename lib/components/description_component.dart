import 'package:flutter/material.dart';

class DescriptionComponent extends StatefulWidget {
  final String text;
  final int lines;
  final bool hasImage;
  const DescriptionComponent({super.key,required this.text, required this.hasImage,this.lines = 2});

  @override
  State<DescriptionComponent> createState() => _DescriptionComponentState();
}

class _DescriptionComponentState extends State<DescriptionComponent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    //vérifiér que les long texte peuvent être affiché sur deux ligne (texte classique)
    TextPainter bigTextPainter = TextPainter(
      text: TextSpan(text: widget.text),
      textDirection: TextDirection.ltr,
      maxLines: widget.hasImage? 2: 15,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    bool isBigTextOverflowed = bigTextPainter.didExceedMaxLines;

    //vérifiér que les text qui seront affiché avec décoration pourat être visible
    TextPainter smallTextPainter = TextPainter(
      text: TextSpan(text: widget.text,
      style: const TextStyle(
        fontSize: 24,
        fontFamily: "Merriweather"
      )),
      textDirection: TextDirection.ltr,
      maxLines: 4,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    bool isSmallTextOverflowed = widget.hasImage? true : smallTextPainter.didExceedMaxLines;


    return
      isSmallTextOverflowed? Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            maxLines: isExpanded ? null : widget.hasImage? 2 : 15,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 13,
              fontFamily: "Merriweather"
            ),
          ),
          if(isBigTextOverflowed)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Voir moins" : "Voir plus ...",
              style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
            ),
      ):
    Container(
      height: 250,
      color: Colors.red,
      child: Center(
        child: Text(widget.text,
            style: const TextStyle(
              color: Colors.white,
                fontSize: 24,
                fontFamily: "Merriweather"
            )
        ),
      ),
    );
  }
}
