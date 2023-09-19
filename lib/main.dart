import 'package:custom_nosql_2/plugins/nosql_plugin/components/components/collection.dart';
import 'package:custom_nosql_2/plugins/nosql_plugin/components/components/document.dart';
import 'package:custom_nosql_2/plugins/nosql_plugin/nosql_binders.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends NoSqlStateless {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends NoSqlStateful {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          ElevatedButton(onPressed: (){
            widget.manager.createDatabase("myDB");
            var db = widget.manager.getDatabaseByName("myDB");
            if(db != null){
              db.createCollection("users");
              Collection? userCollection = db.getCollectionByName("users");

              if(userCollection != null){
                var doc = Document(collection: userCollection);
                doc.addField({"name":"joel"});
                // doc.addField({"age":"21"});
                // doc.addField({"gender":"male"});
              }
              print(db.toJson());
            }
          }, child: Text("Add Data"))

      ),
    );
  }
}

