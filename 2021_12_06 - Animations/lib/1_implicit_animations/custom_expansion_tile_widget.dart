import 'package:flutter/material.dart';

class CustomExpansionTileWidget extends StatefulWidget {
  final Widget? title;
  final List<Widget> children;
  final bool isExpanded;
  final void Function(bool)? onChanged;
  const CustomExpansionTileWidget({
    Key? key,
    this.title,
    this.children = const [],
    required this.isExpanded,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomExpansionTileWidgetState createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  final duration = Duration(seconds: 1);
  final curve = Curves.ease;

  late bool isExpanded = widget.isExpanded;

  @override
  void didUpdateWidget(covariant CustomExpansionTileWidget oldWidget) {
    if(oldWidget.isExpanded != widget.isExpanded){
      isExpanded = widget.isExpanded;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: widget.title,
          onTap: () => widget.onChanged?.call(!widget.isExpanded),
          trailing: AnimatedRotation(
            duration: duration,
            curve: curve,
            turns: isExpanded ? 0.5 : 0,
            child: Icon(Icons.keyboard_arrow_down_rounded),
          ),
        ),
        ClipRRect(
          child: AnimatedAlign(
            duration: duration,
            curve: curve,
            alignment: Alignment.bottomCenter,
            heightFactor: isExpanded ? 1 : 0,
            child: Column(children: widget.children),
          ),
        )
      ],
    );
  }
}
