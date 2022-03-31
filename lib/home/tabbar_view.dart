import 'package:flutter/material.dart';
import 'package:twittercopy/home_view.dart';

class TwitterTabBarView extends StatefulWidget {
  const TwitterTabBarView({Key? key}) : super(key: key);

  @override
  State<TwitterTabBarView> createState() => _TwitterTabBarViewState();
}

class _TwitterTabBarViewState extends State<TwitterTabBarView> {

  String _githubPhotoUrl = "https://avatars0.githubusercontent.com/u/17102578?s=4606v=4";
  int defaultTabLength = 4;
  bool _isHeaderClose = false;

  late ScrollController scrollController;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener(() {

      if(scrollController.offset <= 0){
        _isHeaderClose = false;
      }
      else if(scrollController.offset >= scrollController.position.maxScrollExtent){
        _isHeaderClose = true;
      }
      else {
        _isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });

      print(scrollController.offset);
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Material(
        child: Scaffold(
          bottomNavigationBar: _bottomAppBar,
          body: SafeArea(
            child: Column(
              children: [
                _containerAppbar,
                Expanded(
                  child: TabBarView(
                    children: [
                      HomeView(scrollController),
                      Text("2"),
                      Text("3"),
                      Text("4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget get _bottomAppBar => BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 0,
    child: _tabbarItems,
  );

  Widget get _containerAppbar => AnimatedContainer(
    duration: Duration(milliseconds: 500),
    height: _isHeaderClose ? 0 : 50,
    child: _appBar,
  );

  Widget get _appBar => AppBar(
    title: _appBarItems,
    centerTitle: false,
    elevation: 0,
  );

  Widget get _appBarItems => Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 3,
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(
            _githubPhotoUrl
        ),
      ),
      Text(
        "Home",
        style: titleTextStyle,
      ),
    ],
  );

  Widget get _tabbarItems => TabBar(
    tabs: [
      Tab(icon: Icon(Icons.dashboard),),
      Tab(icon: Icon(Icons.dashboard),),
      Tab(icon: Icon(Icons.dashboard),),
      Tab(icon: Icon(Icons.dashboard),),
    ],
  );


}

final titleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  letterSpacing: -0.5,
);
