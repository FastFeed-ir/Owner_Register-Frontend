import 'dart:async';
import 'package:flutter/material.dart';
import 'package:FastFeed/utils/constants.dart';

class ConfirmationDialog extends StatefulWidget {
  final String phoneNumber;
  ConfirmationDialog({required this.phoneNumber});

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
  // final _codeController = TextEditingController();
  Timer? _timer;
  int _resendSeconds = 100;

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

  void _confirmCode(String code) {
    // print(code);
    // code to verify the confirmation code entered by the user
    //TODO send code for verification
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('تایید شماره تلفن همراه'),
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
          SizedBox(height: 16),
          Opacity(
            opacity: (_resendSeconds != 0) ? 1.00 : 0.00,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
          ),
          Opacity(
            opacity: (_resendSeconds == 0) ? 1.00 : 0.00,
            child: SizedBox(
              child: TextButton.icon(
                // style: ButtonStyle( color: Colors.red,),
                onPressed: (_resendSeconds == 0) ? _resendCode : null,
                icon: Icon(
                  Icons.restart_alt_outlined,
                  size: 20,
                  color: RedColor,
                ),
                label: Text(
                  "ارسال مجدد",
                  style: TextStyle(fontSize: 15, color: RedColor),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: YellowColor,
            fixedSize: Size.fromWidth(150),
          ),
          onPressed: () => _confirmCode(
              t0.text + t1.text + t2.text + t3.text + t4.text + t5.text),
          child: Text(
            'تایید',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
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
        controller: t,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'IranSansWeb',),
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            if (index < 6) {
              FocusScope.of(context).previousFocus();
            } else {
              FocusScope.of(context).unfocus();
            }
          }
        },
      ),
    );
  }
}
