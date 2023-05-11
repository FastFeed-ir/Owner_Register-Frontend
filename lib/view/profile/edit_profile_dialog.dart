import 'package:FastFeed/view/profile/components/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../main.dart';
import '../../model/entity/owner.dart';
import '../../utils/Hive/owner/Hive_owner.dart';
import '../../utils/constants.dart';
import '../../view_model/owner_viewmodel.dart';
import '../header_footer/components/footer.dart';
import '../home/components/header_panel.dart';

class EditProfileDialog extends StatefulWidget {
  EditProfileDialog({super.key});
  HiveOwner owner = ownerBox.get('Owner');
  @override
  EditProfileDialogState createState() => EditProfileDialogState();
}

class EditProfileDialogState extends State<EditProfileDialog> {
  //TODO fix attributes
  String _name = '';
  String _lastName = '';
  String _phoneNumber ='';
  final _ownermodel = OwnerViewModel();
  final List<Owner> _owners = [];
@override
  void initState() {
  searchOwners();
  }
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WhiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderPanel(),
              _owners.isEmpty? loading():profile(widget.owner),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
  AlertDialog profile(HiveOwner owner) {
    for(var item in _owners){
        _name = item.first_name?? '';
        _lastName = item.last_name?? '';
        _phoneNumber = item.phone_number?? '';
    }
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
  void searchOwners() async {
    _ownermodel.searchOwners(widget.owner.id!);
    _ownermodel.owners.stream.listen((list) {
      setState(() {
        _owners.addAll(list);
      });
    });
  }
}
