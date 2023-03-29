import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/view/header_footer/components/header.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/verifyCode/components/verifyCode.dart';

class OwenerRegisterScreen extends StatefulWidget {
  const OwenerRegisterScreen({Key? key}) : super(key: key);

  @override
  _OwenerRegisterScreen createState() => _OwenerRegisterScreen();
}

class _OwenerRegisterScreen extends State<OwenerRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Header(),
                OwnerRegister(),
                SizedBox(height: 20.r),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OwnerRegister extends StatefulWidget {
  const OwnerRegister({Key? key}) : super(key: key);

  @override
  State<OwnerRegister> createState() => _OwnerRegisterState();
}

class _OwnerRegisterState extends State<OwnerRegister> {
  //dropdown options for type of business
  final List<String> _businessTypes = ['رستوران', 'کافه'];
  final _formKey = GlobalKey<FormState>();
//dropdown options for province
//   final List<String> _provinces = [
//     'Province 1',
//     'Province 2',
//   ];

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
    return Container(
        child: Column(
      children: [
        Container(
          width: 1920.w,
          height: 1080.h,
          decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(OwnerPageimg),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 150.w, top: 250.w),
                    child: SizedBox(
                      child: Text("ثبت‌نام فروشندگان فست ‌فید",
                          style: TextStyle(fontSize: 70.w,color:Colors.white,)),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 150.w, top: 50.r),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      // height: MediaQuery.of(context).size.width /2.6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 20.w, color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //dropdown for type of business
                                DropdownButtonFormField<String>(
                                  style: TextStyle(fontSize: 20.w),
                                  decoration: InputDecoration(
                                    labelText: 'انتخاب نوع کسب و کار',
                                  ),
                                  value: _selectedBusinessType,
                                  items: _businessTypes
                                      .map((businessType) =>
                                          DropdownMenuItem(
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
                                SizedBox(height: 16.0.h),

                                //dropdown for province
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      labelText: 'انتخاب استان'),
                                  value: _selectedProvince,
                                  items: Proviences
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
                                SizedBox(height: 16.0.h),

                                //dropdown for city
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      labelText: 'نام شهر'),
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
                                      return 'لطفا شهر خود را وارد کنید';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0.h),

                                //text input for business name
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'نام فروشگاه'),
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
                                SizedBox(height: 16.0.h),

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
                                SizedBox(height: 16.0.h),

                                //text input for business owner's last name
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText:
                                          "نام خانوادگی مالک فروشگاه"),
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
                                SizedBox(height: 16.0.h),

                                //number input for business owner's phone number
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "شماره تلفن همراه"),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    _businessOwnerPhone =
                                        int.tryParse(value);
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "لطفا شماره خود را وارد کنید";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16.0.h),

                                //button to submit the form
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: YellowColor,
                                    ),
                                    onPressed: () {
                                      // if (_formKey.currentState!
                                      //     .validate()) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ConfirmationDialog(
                                                phoneNumber: '$_businessOwnerPhone');
                                          },
                                        );
                                      // }
                                    },
                                    child: Text(
                                      'دریافت کد تایید',
                                      style: TextStyle(color: Colors.black),
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
        SizedBox(
          height: 20.r,
        ),
        Text("مراحل ثبت نام",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.w)),
        SizedBox(
          height: 20.r,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 150.w),
              child: IconRow(
                title: "ثبت اطلاعات مالک",
                text: 'اطلاعات هویتی، اطلاعات تماس',
                iconData: Icons.document_scanner_outlined,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconRow(
              title: "ثبت اطلاعات فروشگاه",
              text: 'اطلاعات تجاری، اطلاعات تماس، آدرس',
              iconData: Icons.store_mall_directory_outlined,
            ),
            SizedBox(
              width: 10.w,
            ),
            IconRow(
              title: "منو",
              text: 'مدیریت دسته بندی و موارد فروش',
              iconData: Icons.menu_book_outlined,
            ),
            SizedBox(
              width: 10.w,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 150.w,
              ),
              child: IconRow(
                title: "خرید اشتراک",
                text: 'به جمع فروشندگان فست فید خوش آمدید',
                iconData: Icons.shopping_bag_outlined,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 150.r,
        ),
        Text("مزایای همکاری با فست فید",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.w)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 150.r,
              ),
              child: IconRow(
                title: "دسترسی سریع",
                text: 'دسترسی سریع و راحت به منو',
                iconData: Icons.speed_outlined,
              ),
            ),
            SizedBox(
              width: 175.w,
            ),
            IconRow(
              title: "کاهش خطا",
              text: 'کم کردن خطای انسانی',
              iconData: Icons.error_outline,
            ),
            SizedBox(
              width: 175.w,
            ),
            IconRow(
              title: "صرفه‌جویی در منابع",
              text: 'کاهش منابع انسانی، کاهش هزینه ها',
              iconData: Icons.trending_down,
            ),
            SizedBox(
              width: 175.w,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 150.w,
              ),
              child: IconRow(
                title: "پشتیبانی کامل",
                text: 'با پشتیبانی ویژه در خدمت شما و مشتریان هستیم',
                iconData: Icons.support_agent_outlined,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

class IconRow extends StatelessWidget {
  final String title;
  final String text;
  final IconData iconData;

  // final Color color;

  const IconRow({
    Key? key,
    required this.title,
    required this.text,
    required this.iconData,
    // required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.red,
            size: 50,
          ),
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
              textAlign: TextAlign.center),
          Text(text,
              style: TextStyle(
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center),
          SizedBox(height: 4.r),
          // Text(text),
        ],
      ),
    );
  }
}
