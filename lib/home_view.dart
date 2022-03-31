import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String _githubPhotoUrl = "https://avatars0.githubusercontent.com/u/17102578?s=4606v=4";

  String _randomImage = "https://picsum.photos/200";

  String _dummyText = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";

  int defaultTabLength = 4;

  bool _isHeaderClose = false;
  double lastOffset = 0;

  late ScrollController scrollController;

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
    return Scaffold(
      floatingActionButton: _fabButton,
      body: SafeArea(
        child: DefaultTabController(
          length: defaultTabLength,
          child: Column(
            children: [
              _containerAppbar,
              _tabbarItems,
              _expandedListView,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _fabButton => FloatingActionButton(
    onPressed: (){},
    child: Icon(
      Icons.adb,
    ),
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

  Widget get _expandedListView => Expanded(
    child: _listView,
  );

  Widget get _listView => ListView.builder(
    controller: scrollController,
    physics: BouncingScrollPhysics(),
    itemCount: 3,
    itemBuilder: (context, index){
      return _listViewCard;
    },
  );

  Widget get _listViewCard => Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          _randomImage,
        ),
      ),
      title: Wrap(
        runSpacing: 5,
        children: [
          _listCardTitle("Helloo"),
          Text(
            _dummyText,
          ),
          _placeHolderField,
          _footerButtonList,
        ],
      ),
    ),
  );

  Widget get _emptySpace => SizedBox(
    height: 10,
  );

  Widget _listCardTitle(String text) => Text(
    text,
    style: titleTextStyle,
  );

  Widget get _placeHolderField => Container(
    height: 100,
    child: Placeholder(),
  );

  Widget get _footerButtonList => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _iconLabelButton(),
      _iconLabelButton(),
      _iconLabelButton(),
      _iconLabelButton(),
    ],
  );

  Widget _iconLabel(String text) => Wrap(
    spacing: 5,
    children: [
      Icon(Icons.comment),
      Text(text),
    ],
  );

  Widget _iconLabelButton() => InkWell(
    child: _iconLabel("1"),
    onTap: (){},
  );
}

final titleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  letterSpacing: -0.5,
);
