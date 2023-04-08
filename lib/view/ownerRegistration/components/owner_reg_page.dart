import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/utils/constants.dart';
import 'package:FastFeed/view/verifyCode/components/verifyCode.dart';
import '../../home/components/header_panel.dart';
import '../../../model/entity/store.dart';

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
                HeaderPanel(),
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
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//form field variables
  late String _title;
  String? _logo;
  late String _business_type;
  late String _state;
  String? _city;
  String? _address;
  late int _telephone_number;
  late int _tables_count;
  String? _instagram_page_link;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: 1920.w,
          height: 1180.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(OwnerPageimg),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 150.w, top: 45.r, right: 150),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          border: Border.all(
                              width: 20.w, color: Colors.transparent),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                "ثبت‌نام فروشندگان فست ‌فید",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.w,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 25.h),
                              // Row 1
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      style: TextStyle(fontSize: 20.w),
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.store_mall_directory_outlined,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: YellowColor),
                                        ),
                                        labelText: 'انتخاب نوع کسب و کار',
                                        hoverColor: Colors.white,
                                        helperText: "",
                                        helperStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      dropdownColor: YellowColor,
                                      value: _business_type,
                                      items: _businessTypes.map((businessType) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            businessType,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: businessType,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _business_type = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'لطفا نوع کسب و کار خود را انتخاب کنید';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 16.0.w),
                                  Expanded(
                                    child: DropdownButtonFormField<String>(
                                      menuMaxHeight: 200,
                                      style: TextStyle(fontSize: 15.w),
                                      decoration: const InputDecoration(
                                        labelText: 'انتخاب استان',
                                        helperText: "",
                                        helperStyle:
                                            TextStyle(color: Colors.white),
                                        suffixIcon: Icon(
                                          Icons.location_city_outlined,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: YellowColor),
                                        ),
                                      ),
                                      dropdownColor: YellowColor,
                                      value: _state,
                                      items: Proviences.map((province) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            province,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: province,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _state = value!;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'لطفا استان خود را انتخاب کنید';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25.0.h),
                              // Row 2
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.apartment_outlined,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: YellowColor),
                                        ),
                                        labelText: 'نام شهر',
                                        helperText: "",
                                        helperStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        setState(() {
                                          _city = value;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 16.0.w),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.home_outlined,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: YellowColor),
                                        ),
                                        labelText: 'آدرس',
                                        helperText: "",
                                        helperStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        _address = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // Row 3
                              SizedBox(height: 25.0.h),

                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.local_mall_outlined,
                                            color: Colors.white,
                                          ),
                                          border: OutlineInputBorder(),
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: YellowColor),
                                          ),
                                          labelText: 'نام فروشگاه',
                                          helperText: "",
                                          helperStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                        onChanged: (value) {
                                          _title = value;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'لطفا نام فروشگاه خود را وارد کنید';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 16.0.w),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.table_bar_outlined,
                                            color: Colors.white,
                                          ),
                                          border: OutlineInputBorder(),
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: YellowColor),
                                          ),
                                          labelText: "تعداد میز",
                                          helperText: "",
                                          helperStyle:
                                              TextStyle(color: Colors.white),
                                        ),
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(color: Colors.white),
                                        onChanged: (value) {
                                          _tables_count = value as int;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "لطفا تعداد میز را وارد کنید";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ]),
                              SizedBox(height: 25.0.h),

                              // Row 4
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: TextFormField(
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                      border: OutlineInputBorder(),
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: YellowColor),
                                      ),
                                      labelText: "شماره تلفن همراه",
                                      helperText: "",
                                      helperStyle:
                                          TextStyle(color: Colors.white),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      _telephone_number = int.tryParse(value)!;
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "لطفا شماره خود را وارد کنید";
                                      }
                                      return null;
                                    },
                                  )),
                                  SizedBox(width: 16.0.w),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.phone_android_outlined,
                                          color: Colors.white,
                                        ),
                                        border: OutlineInputBorder(),
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: YellowColor),
                                        ),
                                        labelText: 'آدرس صفحه اینستاگرام',
                                        helperText: "",
                                        helperStyle:
                                            TextStyle(color: Colors.white),
                                      ),
                                      style: TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        _instagram_page_link = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        // width: 50,
                                        height: 50,
                                        child: Column(
                                          children: [
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all<Color>(
                                                            Colors.transparent),
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white)))),
                                                onPressed: () {
                                                  myAlert();
                                                },
                                                child: Text('افزودن لوگو')),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            //if image not null show the image
                                            //if image null show text
                                            image != null
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: Image.file(
                                                        //to show image, you type like this.
                                                        File(image!.path),
                                                        fit: BoxFit.cover,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 300,
                                                      ),
                                                    ),
                                                  )
                                                : Text(
                                                    "No Image",
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                          ],
                                        ))
                                  ]),
                              SizedBox(height: 25.0.h),
                              //button to submit the form
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                height: 70.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: YellowColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Store store = Store(
                                        title: _title,
                                        logo: _logo,
                                        business_type: _business_type,
                                        state: _state,
                                        city: _city,
                                        address: _address,
                                        telephone_number: _telephone_number,
                                        tables_count: _tables_count,
                                        instagram_page_link: _instagram_page_link
                                      );
                                      // Get.toNamed()
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ConfirmationDialog(
                                              phoneNumber: '$_telephone_number');
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'ثبت اطلاعات',
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
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.r,
        ),
        Text(
          "مراحل ثبت نام",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.w),
        ),
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
