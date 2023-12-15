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
    return BottomAppBar(
      color: Colors.white,
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
                text: "Home",
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

  final primaryColor = const Color(0xFF2F9BFF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: selected ? primaryColor : Colors.black54,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: selected ? primaryColor : Colors.black54,
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
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final primaryColor = const Color(0xFF2F9BFF);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColor,
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
