import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

//dropdown options for type of business
  final List<String> _businessTypes = ['رستوران', 'کافه'];

//dropdown options for province
  final List<String> _provinces = [
    'Province 1',
    'Province 2',
  ];

//dropdown options for city
  final List<String> _cities = [
    'Kathmandu',
    'Pokhara',
  ];

//form field variables
  String? _selectedBusinessType;
  String? _selectedProvince;
  String? _selectedCity;
  String? _businessName;
  String? _businessOwnerFirstName;
  String? _businessOwnerLastName;
  int? _businessOwnerPhone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 150.w, top: 200.w),
                  child: SizedBox(
                    child: Text("ثبت‌نام فروشندگان فست ‌فید",
                        style: TextStyle(fontSize: 70.w)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 150.w, top: 40),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(width: 10, color: Colors.transparent),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              //dropdown for type of business
                              DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    labelText: 'انتخاب نوع کسب و کار'),
                                value: _selectedBusinessType,
                                items: _businessTypes
                                    .map((businessType) => DropdownMenuItem(
                                          child: Text(businessType),
                                          value: businessType,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedBusinessType = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'لطفا نوع کسب و کار خود را انتخاب کنید';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

                              //dropdown for province
                              DropdownButtonFormField<String>(
                                decoration:
                                    InputDecoration(labelText: 'انتخاب استان'),
                                value: _selectedProvince,
                                items: _provinces
                                    .map((province) => DropdownMenuItem(
                                          child: Text(province),
                                          value: province,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedProvince = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'لطفا استان خود را انتخاب کنید';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

                              //dropdown for city
                              DropdownButtonFormField<String>(
                                decoration:
                                    InputDecoration(labelText: 'انتخاب شهر'),
                                value: _selectedCity,
                                items: _cities
                                    .map((city) => DropdownMenuItem(
                                          child: Text(city),
                                          value: city,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCity = value;
                                  });
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'لطفا شهر خود را انتخاب کنید';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

                              //text input for business name
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'نام فروشگاه'),
                                onChanged: (value) {
                                  _businessName = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'لطفا نام فروشگاه را وارد کنید';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

                              //text input for business owner's first name
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "نام مالک فروشگاه"),
                                onChanged: (value) {
                                  _businessOwnerFirstName = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "لطفا نام خود را وارد کنید";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

                              //text input for business owner's last name
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "نام خانوادگی مالک فروشگاه"),
                                onChanged: (value) {
                                  _businessOwnerLastName = value;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "لطفا نام خانوادگی خود را وارد کنید";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

//number input for business owner's phone number
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "شماره تلفن همراه"),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  _businessOwnerPhone = int.tryParse(value);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "لطفا شماره خود را وارد کنید";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.0),

                              //button to submit the form
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      //TODO: submit the form
                                    }
                                  },
                                  child: Text(
                                    'دریافت کد تایید',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "درخواست مجدد",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
