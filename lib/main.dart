import 'package:flutter/material.dart';
import 'package:lab3_new/list_item.dart';
import 'package:lab3_new/widgets/nov_element.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<ListItem> _userItems = [
    ListItem("T1", "Algorithms and data structures", DateTime.now()),
    ListItem("T2", "Operating systems", DateTime.now()),
  ];

  void _addItemFunction(BuildContext context) {

    showModalBottomSheet(context: context, builder: (_){
        return GestureDetector(
          onTap: (() {
            
          }),
          behavior: HitTestBehavior.opaque,
          child: NovElement(_addNewItemToList),
        );

    });
  }

  void _addNewItemToList(ListItem item) {
    setState(() {
      _userItems.add(item);
    });
  }
 
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тimetable for colloquiums'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _addItemFunction(context), 
            icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
      child: _userItems.isEmpty ? const Text("No elements") :
      ListView.builder(
        itemCount: _userItems.length,
        itemBuilder: ((context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          child: ListTile(
            title: Text(_userItems[index].naslov, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("${_userItems[index].datum}"),
          )
        );
      }
      ))
    ));
  }
}
