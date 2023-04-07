import 'package:FastFeed/view/profile/components/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class EditProfileDialog extends StatefulWidget {
  const EditProfileDialog({super.key});

  @override
  EditProfileDialogState createState() => EditProfileDialogState();
}

class EditProfileDialogState extends State<EditProfileDialog> {
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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.centerRight,
        child: const Text('تغییر حساب کاربری'),
      ),
      content: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textFormField(_nameController, 'نام', _name),
              const SizedBox(height: 16.0),
              textFormField(_lastNameController, 'نام خانوادگی', _lastName),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Text('شماره تماس : ${_phoneNumber.toPersianDigit()}'),
              ),
              const SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text('ثبت اطلاعات'),
                    onPressed: () {
                      //TODO send request to server
                      if (_nameController.text != "" &&
                          _lastNameController.text != "") {
                        setState(() {
                          _name = _nameController.text;
                          _lastName = _lastNameController.text;
                          _nameController.clear();
                          _lastNameController.clear();
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  ElevatedButton(
                    child: const Text('انصراف'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
