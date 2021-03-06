import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'FIRST'),
    new Tab(text: 'SECOND'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample app'),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: [
          new ListView.builder(itemBuilder: ListData().build),
          new ListView.builder(itemBuilder: ListData().build),
         // _buildList(),  
        ],
      ),
      bottomNavigationBar: new TabBar(
        controller: _tabController,
        tabs: myTabs,
        labelColor: Colors.blue,
      ),
    );
  }
}

// Widget _buildList({String key, String string}) {
//   return new ListView.builder(
//       key: PageStorageKey(key), itemBuilder: ListData().build);
// }

class ListData {
  static ListData _instance = ListData._internal();

  ListData._internal();

  factory ListData() {
    return _instance;
  }

  Random _rand = Random();
  Map<int, int> _values = new Map();

  Widget build(BuildContext context, int index) {
    if (!_values.containsKey(index)) {
      _values[index] = _rand.nextInt(20);
    }

    return Text(
      'Random number ${_values[index]}',
    );
  }
}
