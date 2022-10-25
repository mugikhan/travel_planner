import 'package:flutter/material.dart';

class HotelScaffold extends StatelessWidget {
  const HotelScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.leading,
    this.footerButtons,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? leading;
  final List<Widget>? footerButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: leading ?? Container(),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: body,
      persistentFooterButtons: footerButtons,
    );
  }
}

class HotelScaffoldWeb extends StatelessWidget {
  const HotelScaffoldWeb({
    Key? key,
    required this.title,
    required this.body,
    this.leading,
  }) : super(key: key);

  final String title;
  final Widget body;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title),
        leading: leading ?? Container(),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: body,
    );
  }
}
