import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/models/content_model.dart';

class Previews extends StatefulWidget {
  final String title;
  final List<Content> contentList;

  Previews({this.title, this.contentList});

  @override
  _PreviewsState createState() => _PreviewsState();
}

class _PreviewsState extends State<Previews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              Content content = widget.contentList[index];
              return GestureDetector(
                onTap: () {
                  print(content.name);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        border: Border.all(width: 4.0, color: content.color),
                      ),
                    ),
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.black87,
                          Colors.black,
                          Colors.transparent
                        ],
                        stops: [0,0,25],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter),
                        shape: BoxShape.circle,
                        border: Border.all(width: 4.0, color: content.color),
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: SizedBox(
                          height: 60.0,
                          child: Image.asset(content.titleImageUrl),
                        )),
                  ],
                ),
              );
            },
            itemCount: widget.contentList.length,
          ),
        )
      ],
    );
  }
}
