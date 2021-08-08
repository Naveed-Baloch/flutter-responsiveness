import 'package:flutter/material.dart';

class VerticalIconButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  VerticalIconButton({this.icon, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
