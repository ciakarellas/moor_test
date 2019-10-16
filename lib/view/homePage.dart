import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Rachunki'),),
      body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(child: _buildTaskList(context),),
            InputBill()
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<Bill>> _buildTaskList(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return StreamBuilder(
      stream: database.watchAllBills(),
      builder: (context, AsyncSnapshot<List<Bill>> snapshot) {
        final bills = snapshot.data ?? List();

        return ListView.builder(
          itemCount: bills.length,
          itemBuilder: (_, index) {
            final itemTask = bills[index];
            return _buildListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildListItem (itemList, AppDatabase database){
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(4),
          child: Text(itemList.comment),
        ),
        Padding(
          padding: EdgeInsets.all(4),
          child: FlatButton(
            onPressed: (){
              database.deleteBill(itemList);
            },
            child: Icon(Icons.delete),
          ),
        )
      ],
    );
  }
}

class InputBill extends StatefulWidget {
  @override
  State<InputBill> createState() => InputBillState();
  
}

class InputBillState extends State<InputBill>{

  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          _buildTextField(context)
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context){
    return Expanded(
      child: TextField(
        controller: controller,
        onSubmitted: (inputName) {
          final database = Provider.of<AppDatabase>(context);
          final task = Bill(
            comment: inputName,
          );
          database.insertNewBill(task);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      controller.clear();
    });
  }
}