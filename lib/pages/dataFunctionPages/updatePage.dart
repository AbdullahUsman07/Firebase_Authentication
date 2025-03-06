import 'package:firebase_practice/firebase/firebase_database.dart';
import 'package:firebase_practice/widgets/customButton.dart';
import 'package:firebase_practice/widgets/customInput.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController _collectioncontroller = TextEditingController();
  TextEditingController _doccontroller = TextEditingController();
  TextEditingController _feildcontroller = TextEditingController();
  TextEditingController _newfeildcontroller = TextEditingController();

  @override
  void dispose() {
    _collectioncontroller.dispose();
    _doccontroller.dispose();
    _feildcontroller.dispose();
    _newfeildcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
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
              CustomFormFeild(title: 'Doc Name', controller: _doccontroller),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(
                  title: 'feild you wanna update',
                  controller: _feildcontroller),
              const SizedBox(
                height: 20,
              ),
              CustomFormFeild(
                  title: 'new feild', controller: _newfeildcontroller),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  title: 'Update',
                  onTap: () {
                    update(_collectioncontroller.text, _doccontroller.text,
                        _feildcontroller.text, _newfeildcontroller.text);
                        _collectioncontroller.clear();
                        _doccontroller.clear();
                        _feildcontroller.clear();
                        _newfeildcontroller.clear();

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
