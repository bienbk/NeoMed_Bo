import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  final List<Widget> item;
  final Function() loadMoreItem;
  final int total;
  const CustomListView(
      {Key? key,
      required this.item,
      required this.loadMoreItem,
      required this.total})
      : super(key: key);
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print("Scroll pixel: " +
          _scrollController.position.pixels.toString() +
          ', Max extent: ' +
          _scrollController.position.maxScrollExtent.toString());
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.item.length < widget.total) {
          widget.loadMoreItem();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemExtent: 50,
          itemCount: widget.item.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == widget.item.length - 1 &&
                widget.item.length < widget.total) {
              // do loading
            }
            return widget.item[index];
          }),
    );
  }
}
