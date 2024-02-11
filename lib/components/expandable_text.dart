import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key,required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    TextPainter textPainter = TextPainter(
      text: TextSpan(text: widget.text),
      textDirection: TextDirection.ltr,
      maxLines: 2,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    bool isTextOverflowed = textPainter.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : 2,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 13,
            fontFamily: "Merriweather"
          ),
        ),
        if(isTextOverflowed)
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
    );
  }
}
