import 'package:flutter/material.dart';

class BaseBottomNavigationBar extends StatefulWidget {
  final Function(int index) onTapItem;
  final int selectIndex;
  final List<String> barList;

  const BaseBottomNavigationBar({
    super.key,
    required this.onTapItem,
    required this.selectIndex,
    required this.barList,
  });

  @override
  State<BaseBottomNavigationBar> createState() =>
      BaseBottomNavigationBarState();
}

class BaseBottomNavigationBarState extends State<BaseBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        for (var bar in widget.barList)
          BottomNavigationBarItem(icon: const Icon(Icons.list_alt), label: bar),
      ],
      currentIndex: widget.selectIndex,
      onTap: widget.onTapItem,
      type: BottomNavigationBarType.fixed,
    );
  }
}
