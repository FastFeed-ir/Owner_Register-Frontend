import 'package:FastFeed/view/profile/components/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: const Text('تغییر پروفایل'),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Material(
            color: Colors.white,
            elevation: 8.0,
            shadowColor: Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child:
                        Text('شماره تماس : ${_phoneNumber.toPersianDigit()}'),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    child: const Text('تغییر اطلاعات'),
                    onPressed: () => _showConfirmationDialog,
                  ),
                  const SizedBox(
                    height: 56.0,
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('خروج از حساب کاربری'),
                    onPressed: () {
                      //TODO onPressed navigation
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
                //TODO send request to server
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
}
