import 'package:flutter/material.dart';

import 'starterspage.dart';

class AppetizersPage extends StatefulWidget {
  const AppetizersPage({Key? key}) : super(key: key);

  @override
  State<AppetizersPage> createState() => _AppetizersPageState();
}

class _AppetizersPageState extends State<AppetizersPage> {
  bool _isExpanded = true;
  @override
  void initState() {
    _isExpanded = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          initiallyExpanded: _isExpanded,
          iconColor: Colors.black,
          title: Row(
            children: [
              const Text(
                "Appetizers (6)",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              RotationTransition(
                turns: _isExpanded
                    ? const AlwaysStoppedAnimation(0.0)
                    : const AlwaysStoppedAnimation(0.5),
              ),
            ],
          ),
          children: [
            if (_isExpanded) const StartersPage(),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
        ),
      ],
    );
  }
}
