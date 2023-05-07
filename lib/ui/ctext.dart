import 'package:flutter/material.dart';

class Ctext extends StatefulWidget {
  final Text text;
  const Ctext({super.key, required this.text});

  @override
  State<Ctext> createState() => _CtextState();
}

class _CtextState extends State<Ctext> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [widget.text],
    );
  }
}
