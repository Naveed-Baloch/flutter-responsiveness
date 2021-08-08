import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentLsit;
  final bool isOriginals;

  ContentList({this.title, this.contentLsit, this.isOriginals = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Container(
            height: isOriginals ? 500.0 : 200,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                final Content content = contentLsit[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: isOriginals ? 400 : 200,
                    width: isOriginals ? 200.0 : 135.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        content.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    )),
                  ),
                );
              },
              itemCount: contentLsit.length,
            ),
          )
        ],
      ),
    );
  }
}
