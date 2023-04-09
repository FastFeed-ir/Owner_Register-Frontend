import 'package:flutter/material.dart';
import 'package:FastFeed/utils/constants.dart';

class PhoneNumberDialog extends StatefulWidget {
  @override
  _PhoneNumberDialogState createState() => _PhoneNumberDialogState();
}

class _PhoneNumberDialogState extends State<PhoneNumberDialog> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ورود و عضویت"),
      content: TextFormField(
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.phone,
            color: Colors.black,
          ),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: YellowColor),
          ),
          labelText: "شماره تلفن همراه",
          helperText: "",
          helperStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        style: TextStyle(
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "لطفا شماره خود را وارد کنید";
          }
          return null;
        },
      ),
      actions: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: YellowColor, fixedSize: Size.fromWidth(200)),
            onPressed: () {
              Navigator.of(context).pop(_phoneController.text);
            },
            child: Text("ادامه",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                )),
          ),
        ),
      ],
    );
  }
}
