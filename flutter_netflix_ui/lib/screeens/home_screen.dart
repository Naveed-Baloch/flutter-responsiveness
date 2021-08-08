import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_netflix_ui/data/data.dart';
import 'package:flutter_netflix_ui/provider/app_bar_controller.dart';
import 'package:flutter_netflix_ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
        Provider.of<AppBarController>(context,listen: false).setOffset(_scrollOffset);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return  Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          child: Icon(Icons.cast),
          onPressed: () {},
        ),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: CustomAppBar(),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ContentHeader(
                featuredContent: sintelContent,
              ),
            ),
            SliverPadding(
              key: PageStorageKey('preview'),
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              sliver: SliverToBoxAdapter(
                child: Previews(title: 'Previews', contentList: previews),
              ),
            ),
            SliverToBoxAdapter(
              key: PageStorageKey('mylist'),
              child: ContentList(
                title: 'My List',
                contentLsit: myList,
              ),
            ),
            SliverToBoxAdapter(
              key: PageStorageKey('netflixoriginal'),
              child: ContentList(
                title: 'Netflix Original ',
                contentLsit: originals,
                isOriginals: true,
              ),
            ),
            SliverPadding(
              key: PageStorageKey('trending'),
              padding: const EdgeInsets.only(bottom: 20.0),
              sliver: SliverToBoxAdapter(
                child: ContentList(
                  title: 'Trending',
                  contentLsit: trending,
                ),
              ),
            )
          ],
        ),
    );
  }
}
