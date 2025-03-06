import 'package:firebase_practice/firebase/firebase_database.dart';
import 'package:firebase_practice/widgets/customButton.dart';
import 'package:firebase_practice/widgets/customInput.dart';
import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  TextEditingController _docName = TextEditingController();
  TextEditingController _colName = TextEditingController();

  @override
  void dispose() {
    _docName.dispose();
    _colName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Delete Record'),
          elevation: 5.0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFormFeild(title: 'Collection Name', controller: _colName),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(title: 'Doc Name', controller: _docName),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  title: 'Delete',
                  onTap: () {
                    delete(_colName.text,_docName.text);
                    _docName.clear();
                    _colName.clear();
                    FocusScope.of(context).unfocus();
                  },
                  color: Theme.of(context).primaryColor),
            ],
          )),
        ));
  }
}
