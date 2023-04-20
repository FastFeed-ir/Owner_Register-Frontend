import 'package:flutter/material.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/verifyCode/components/verifyCode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberDialog extends StatefulWidget {
  @override
  _PhoneNumberDialogState createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<PhoneNumberDialog> {
  late String _phoneController = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      title: Text(
        "ورود یا عضویت",
        style: TextStyle(fontFamily: "IranSansWeb"),
      ),
      content: SizedBox(
        width: 500.w,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: "IranSansWeb",
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: YellowColor),
                  ),
                  labelText: "شماره تلفن همراه",
                  helperText: "شماره با ۰۹ شروع می‌شود",
                  hintText: "09123456789",
                  helperStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: IranSansWeb,
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _phoneController = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length!=11) {
                    return "لطفا شماره خود را وارد کنید";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: YellowColor,
                fixedSize: Size.fromWidth(250),
              ),
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationDialog(
                        phoneNumber: _phoneController,
                      );
                    },
                  );
                }
              },
              child: Text(
                "ادامه",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "IranSansWeb",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
