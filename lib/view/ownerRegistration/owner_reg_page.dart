import 'package:flutter/material.dart';

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
    'Bagmati',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudurpaschim'
  ];

  //dropdown options for city
  final List<String> _cities = [
    'Kathmandu',
    'Pokhara',
    'Biratnagar',
    'Birgunj',
    'Bharatpur',
    'Janakpur',
    'Hetauda',
    'Dharan',
    'Bhim Datta',
    'Butwal'
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width:MediaQuery.of(context).size.width / 3,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //dropdown for type of business
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'انتخاب نوع کسب و کار'),
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
                        return 'Please select a business type';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //dropdown for province
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'انتخاب استان'),
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
                        return 'Please select a province';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //dropdown for city
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'انتخاب شهر'),
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
                        return 'Please select a city';
                    }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //text input for business name
                  TextFormField(
                    decoration: InputDecoration(labelText: 'نام فروشگاه'),
                    onChanged: (value) {
                      _businessName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the business name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //text input for business owner's first name
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: "نام مالک فروشگاه"),
                    onChanged: (value) {
                      _businessOwnerFirstName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the business owner's first name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //text input for business owner's last name
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: "نام خانوادگی مالک فروشگاه"),
                    onChanged: (value) {
                      _businessOwnerLastName = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the business owner's last name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //number input for business owner's phone number
                  TextFormField(
                    decoration:
                    InputDecoration(labelText: "شماره تلفن همراه"),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      _businessOwnerPhone = int.tryParse(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the business owner's phone number";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  //button to submit the form
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //submit the form
                        print('Business Type: $_selectedBusinessType');
                        print('Province: $_selectedProvince');
                        print('City: $_selectedCity');
                        print('Business Name: $_businessName');
                        print('Business Owner First Name: $_businessOwnerFirstName');
                        print('Business Owner Last Name: $_businessOwnerLastName');
                        print('Business Owner Phone Number: $_businessOwnerPhone');
                      }
                    },
                    child: Text('دریافت کد تایید',style: TextStyle(color: Colors.black),),
                  ),
                  Container(
                    child: Text("درخواست مجدد",
                    style:TextStyle(color: Colors.red,),
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}