import 'package:flutter/material.dart';

import 'home/tabbar_view.dart';

class HomeView extends StatefulWidget {

  final ScrollController scrollController;

  const HomeView(this.scrollController, {Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String _randomImage = "https://picsum.photo/200";

  String _dummyText = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.";

  int defaultTabLength = 4;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _fabButton,
      body: _listView,
    );
  }

  Widget get _fabButton => FloatingActionButton(
    onPressed: (){},
    child: Icon(
      Icons.adb,
    ),
  );

  Widget get _listView => ListView.builder(
    controller: widget.scrollController,
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
