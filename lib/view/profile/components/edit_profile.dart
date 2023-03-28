import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  //TODO fix attributes
  String _name = 'دانیال';
  String _lastName = 'توکلی';
  final String _phoneNumber = '555-5555';

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _showConfirmationDialog() {
    var textQuestion =
        'آیا مطمئن هستید که می خواهید نام خود را به ${_nameController.text} ${_lastNameController.text} تغییر دهید؟';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text(
              'ثبت تغییرات',
              textAlign: TextAlign.end,
            ),
          ),
          content: Text(
            textQuestion,
            textAlign: TextAlign.right,
          ),
          actions: [
            TextButton(
              child: const Text('انصراف'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: const Text('تایید'),
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                  _lastName = _lastNameController.text;
                  _nameController.clear();
                  _lastNameController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        elevation: 8.0,
        shadowColor: Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Container(
                    alignment: Alignment.centerRight,
                    child: Text(_name),
                  ),
                ),
                controller: _nameController,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Container(
                    alignment: Alignment.centerRight,
                    child: Text(_lastName),
                  ),
                ),
                controller: _lastNameController,
              ),
              const SizedBox(height: 16.0),
              Text('شماره تماس: $_phoneNumber'),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('تغییر اطلاعات'),
                onPressed: () => _showConfirmationDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
