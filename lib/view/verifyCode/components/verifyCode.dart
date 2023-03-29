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
  final _codeController = TextEditingController();
  Timer? _timer;
  int _resendSeconds = 10;

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
    _resendSeconds = 10;
    _startResendTimer();
  }

  void _confirmCode() {
    String code = _codeController.text;
    // code to verify the confirmation code entered by the user
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
              _buildDigitInput(),
              _buildDigitInput(),
              _buildDigitInput(),
              _buildDigitInput(),
              _buildDigitInput(),
              _buildDigitInput(),
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
          SizedBox(
            child: Opacity(
              opacity: (_resendSeconds == 0) ? 1.00 : 0.00,
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
          onPressed: _confirmCode,
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

  Widget _buildDigitInput() {
    return SizedBox(
      width: 32,
      child: TextField(
        controller: _codeController,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
