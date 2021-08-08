import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_ui/provider/app_bar_controller.dart';
import 'package:flutter_netflix_ui/widgets/responsive.dart';
import 'package:provider/provider.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(
          (Provider.of<AppBarController>(context).getOffset() / 350)
              .clamp(0, 1)
              .toDouble()),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  _AppBarButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(
            image: AssetImage(Assets.netflixLogo0),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('tv shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('tv shows'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('tv shows'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(
            image: AssetImage(Assets.netflixLogo1),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'Home',
                  onTap: () => print('home'),
                ),
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('tv shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('tv shows'),
                ),
                _AppBarButton(
                  title: 'Latest',
                  onTap: () => print('Latest'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('tv shows'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  onPressed: () {
                    print('search');
                  },
                  icon: Icon(Icons.search),
                ),
                _AppBarButton(
                  title: 'KIDS',
                  onTap: () => print('KIDS'),
                ),
                _AppBarButton(
                  title: 'DVD',
                  onTap: () => print('DVD'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  onPressed: () {
                    print('GIft');
                  },
                  icon: Icon(Icons.card_giftcard),
                ),
                IconButton(
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print('Notifications');
                  },
                  icon: Icon(Icons.notifications),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
