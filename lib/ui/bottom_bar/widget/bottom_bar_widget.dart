import 'package:flutter/material.dart';
import 'package:flutter_codelab_2/ui/bottom_bar/view_model/mock.dart';
import 'package:flutter_codelab_2/ui/bottom_bar/view_model/state/bottom_bar_state.dart';
import 'package:flutter_codelab_2/ui/core/color.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  List<BottomBarState> _bottomBarItems = bottomBarListItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          _bottomBarItems.length,
          (index) {
            final barItemWidget = _bottomBarItems[index];

            return IconButton(
              onPressed: () {
                setState(() {
                  for (var element in _bottomBarItems) {
                    element.isSelected = element == barItemWidget;
                  }
                });
              },
              icon: Icon(
                barItemWidget.icon,
                color: barItemWidget.isSelected! ? mainYellow : Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}
