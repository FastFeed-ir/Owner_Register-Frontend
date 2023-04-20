import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../model/entity/owner.dart';
import '../../../view_model/owner_viewmodel.dart';

class ConfirmationDialog extends StatefulWidget {
  final String phoneNumber;
  final verificationId;

  ConfirmationDialog({required this.phoneNumber,required this.verificationId});
  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  TextEditingController t0 = TextEditingController(),
      t1 = TextEditingController(),
      t2 = TextEditingController(),
      t3 = TextEditingController(),
      t4 = TextEditingController(),
      t5 = TextEditingController();

  verifyOTP(String verificationId,String userOTP) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: userOTP);
      await auth.signInWithCredential(credential);
      _confirmCode();

    } on FirebaseAuthException catch(e){
      print(e.toString());
    }
  }
    // final _codeController = TextEditingController();
  Timer? _timer;
  int _resendSeconds = 100;

  final _viewModel = OwnerViewModel();
  final List<Owner> _owners = [];

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resendCode() {
    // code to resend the confirmation code to the user's phone number
    _resendSeconds = 100;
    _startResendTimer();
  }

  void _confirmCode() {

    // print(code);
    // code to verify the confirmation code entered by the user
    //TODO send code for verification
    _viewModel.getOwners();
    _viewModel.owners.stream.listen((list) {
      setState(() {
        _owners.addAll(list);
      });
      bool temp = false;
      for (Owner i in _owners) {
        if (i.phone_number == widget.phoneNumber) {
          temp = true;
          Get.toNamed(HomePage, arguments: i.id);
        }
      }
      if (temp==false) {
        Owner owner = Owner(phone_number: widget.phoneNumber);
        _viewModel.addOwner(owner);
        Get.toNamed(HomePage, arguments: owner.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('تایید شماره تلفن همراه',style: TextStyle(fontFamily: "IranSansWeb",)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            ' لطفا کد ارسال شده به شماره ${widget.phoneNumber} را وارد نمایید ',
            style: TextStyle(
              fontFamily: 'IranSansWeb',
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDigitInput(0, t5),
              _buildDigitInput(1, t4),
              _buildDigitInput(2, t3),
              _buildDigitInput(3, t2),
              _buildDigitInput(4, t1),
              _buildDigitInput(5, t0),
            ],
          ),
          SizedBox(height: 24),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: (_resendSeconds != 0),
                  child: Row(
                    children: [
                      Icon(Icons.timer_outlined, size: 17),
                      Text(
                        ' $_resendSeconds ثانیه تا ارسال مجدد  ',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'IranSansWeb',
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: (_resendSeconds == 0),
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: (_resendSeconds == 0) ? _resendCode : null,
                        icon: Icon(
                          Icons.restart_alt_outlined,
                          size: 20,
                          color: RedColor,
                        ),
                        label: Text(
                          "ارسال مجدد",
                          style: TextStyle(fontSize: 15, color: RedColor,fontFamily: "IranSansWeb",),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: YellowColor,
              fixedSize: Size.fromWidth(250),
            ),
            onPressed: () => verifyOTP(widget.verificationId,
                t0.text + t1.text + t2.text + t3.text + t4.text + t5.text),
            child: Text(
              'تایید',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "IranSansWeb",
              ),
            ),
          ),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  Widget _buildDigitInput(int index, TextEditingController t) {
    return SizedBox(
      width: 42,
      child: TextField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: t,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'IranSansWeb',
        ),
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 6 && index!=0) {
              FocusScope.of(context).previousFocus();
            }
          }
          if(value.isEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
