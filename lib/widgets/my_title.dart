import 'package:flutter/material.dart';

//ignore: must_be_immutable
class MyTitle extends StatelessWidget {
  final String title;
  late TextStyle? style;
  MyTitle({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    style = Theme.of(context).textTheme.displayMedium!;
    return Center(
      child: Text(
        title,
        style: style,
      ),
    );
  }
}
