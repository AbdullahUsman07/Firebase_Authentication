import 'package:firebase_practice/firebase/firebase_database.dart';
import 'package:firebase_practice/widgets/customButton.dart';
import 'package:firebase_practice/widgets/customInput.dart';
import 'package:flutter/material.dart';

class CreateCollection extends StatefulWidget {
  CreateCollection({super.key});

  @override
  State<CreateCollection> createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<CreateCollection> {
  TextEditingController _collectioncontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _qualicontroller = TextEditingController();

  @override
  void dispose() {
    _collectioncontroller.dispose();
    _namecontroller.dispose();
    _agecontroller.dispose();
    _qualicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Collection'),
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
                  title: 'Collection Name', controller: _collectioncontroller),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(title: 'Name', controller: _namecontroller),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(
                title: 'Age',
                controller: _agecontroller,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(
                  title: 'Qualification', controller: _qualicontroller),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  title: 'Save',
                  onTap: () {
                    create(
                        'Student',
                        _namecontroller.text,
                        _namecontroller.text,
                        _qualicontroller.text,
                        _agecontroller.text);
                      _agecontroller.clear();
                      _namecontroller.clear();
                      _qualicontroller.clear();
                      _collectioncontroller.clear();

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
