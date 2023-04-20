import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/verifyCode/components/verifyCode.dart';
import 'package:flutter/services.dart';
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
                  helperText: "شماره با ۹ شروع می‌شود",
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  _phoneController = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length!=10) {
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
              onPressed: () async {
                print('+98${_phoneController}');
                if (_formKey.currentState?.validate() == true) {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  try {
                    await auth.verifyPhoneNumber(
                      phoneNumber: '+98${_phoneController}',
                        verificationCompleted: (PhoneAuthCredential credential) async{},
                        verificationFailed: (e){
                          throw Exception(e.toString());
                        },
                        codeSent: ((String verificationId,int? resendToken) async{
                          await Future.delayed(Duration(seconds: 2));
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ConfirmationDialog(
                                phoneNumber: '+98${_phoneController}',
                                verificationId: verificationId,
                              );
                            },
                          );
                        }),
                        codeAutoRetrievalTimeout: (String verificationId){}
                    );
                  } on FirebaseAuthException catch(e){
                    print(e.toString());
                  }
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
