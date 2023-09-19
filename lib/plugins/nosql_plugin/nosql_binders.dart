import 'package:custom_nosql_2/plugins/nosql_plugin/nosql_manager.dart';
import 'package:flutter/material.dart';

class NoSqlStateless extends StatelessWidget{
  NoSqlStateless({super.key});

  String name = "NoSqlStateless";
  NoSqlManager manager = NoSqlManager();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}

class NoSqlStateful extends StatefulWidget{
  NoSqlStateful({super.key});
  final String name = "NoSqlStateful";

  final NoSqlManager manager = NoSqlManager();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class NoSqlState<T extends NoSqlStateful> extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}