import 'package:flutter/material.dart';

typedef ActionButtonOnTap = void Function(int index);

class ActionButton extends StatefulWidget {
  Image icon;
  Image? actionIcon;
  String text;
  final GestureTapCallback? onTap;
  Color? color = Colors.white;
  int? fontSize = 20;

  bool toggle = false;

  ActionButton(
      {super.key,
      required this.icon,
      this.actionIcon,
      required this.text,
      this.color,
      this.onTap});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.toggle = !widget.toggle;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Column(
        children: [
          widget.toggle ? widget.icon : widget.actionIcon ?? widget.icon,
          Text(
            widget.text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
