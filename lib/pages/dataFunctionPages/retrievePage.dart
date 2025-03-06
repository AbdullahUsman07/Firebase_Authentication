import 'package:firebase_practice/pages/dataFunctionPages/displayRecord.dart';
import 'package:firebase_practice/widgets/customButton.dart';
import 'package:firebase_practice/widgets/customInput.dart';
import 'package:flutter/material.dart';

class RetrievePage extends StatefulWidget {
  const RetrievePage({super.key});

  @override
  State<RetrievePage> createState() => _RetrievePageState();
}

class _RetrievePageState extends State<RetrievePage> {
  TextEditingController _colName = TextEditingController();

  @override
  void dispose() {
    _colName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Records'),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFormFeild(
                  title: 'Enter Collection Name', controller: _colName),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  title: 'Retrieve',
                  onTap: () {
                    if (_colName.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please enter a valid collection name')),
                      );
                      return; // Prevent navigation if colName is empty
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DisplayRecord(colName: _colName.text)));
                  //  _colName.clear();
                    FocusScope.of(context).unfocus();
                  },
                  color: Theme.of(context).primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
