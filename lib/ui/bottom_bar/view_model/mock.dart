import 'package:flutter/material.dart';
import 'package:flutter_codelab_2/ui/bottom_bar/view_model/state/bottom_bar_state.dart';

final List<BottomBarState> bottomBarListItems = [
  BottomBarState(icon: Icons.explore_outlined, isSelected: true),
  BottomBarState(icon: Icons.favorite_border, isSelected: false),
  BottomBarState(icon: Icons.comment_outlined, isSelected: false),
  BottomBarState(icon: Icons.account_circle_outlined, isSelected: false),
];
