import 'dart:math';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: max(MediaQuery.of(context).size.height * 0.10, 90),
      child: BottomAppBar(
        color: colors.secondary,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: IconBottomBar(
                  text: "América",
                  icon: Icons.public,
                  selected: currentIndex == 0,
                  onPressed: () => onPageChanged(0),
                ),
              ),
              Flexible(
                flex: 1,
                child: IconBottomBar2(
                  icon: Icons.home,
                  selected: currentIndex == 1,
                  onPressed: () => onPageChanged(1),
                ),
              ),
              Flexible(
                flex: 1,
                child: IconBottomBar(
                  text: "África",
                  icon: Icons.public,
                  selected: currentIndex == 2,
                  onPressed: () => onPageChanged(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
    Key? key,
    required this.text,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: selected ? colors.onSurface : Colors.black54,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: selected ? colors.onSurface : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  const IconBottomBar2(
      {Key? key,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return CircleAvatar(
      backgroundColor: color,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
