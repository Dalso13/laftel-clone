import 'package:flutter/material.dart';

class StorageKeepAlivePage extends StatefulWidget {
  final Widget _child;
  const StorageKeepAlivePage({
    super.key,
    required Widget child,
  }) : _child = child;
  @override
  createState() => _StorageKeepAlivePageState();
}

class _StorageKeepAlivePageState extends State<StorageKeepAlivePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget._child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}