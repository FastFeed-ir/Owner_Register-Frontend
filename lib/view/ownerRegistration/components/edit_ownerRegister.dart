import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:FastFeed/view/header_footer/components/footer.dart';
import 'package:FastFeed/utils/constants.dart';
import '../../../model/entity/owner.dart';
import '../../../view_model/owner_viewmodel.dart';
import '../../../view_model/store_viewmodel.dart';
import '../../home/components/header_panel.dart';
import '../../../model/entity/store.dart';
import 'dart:html' as html;

class EditOwenerRegisterScreen extends StatefulWidget {
  EditOwenerRegisterScreen({Key? key}) : super(key: key);
  // var ID = Get.arguments;
  var ID = 2;
  @override
  _EditOwenerRegisterScreen createState() => _EditOwenerRegisterScreen();
}

class _EditOwenerRegisterScreen extends State<EditOwenerRegisterScreen> {
  final _storeModel = StoreViewModel();
  final List<Store> _stores = [];
  @override
  void initState() {
    // getStore();
    fetchData();
  }
  Future<void> fetchData() async {
    await getStore();
    print(_stores.length);

    // Now you can use the _stores list here, for example:
    if (_stores.isNotEmpty) {
      setState(() {
        // Update UI with fetched data
        print("shett");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderPanel(ID : widget.ID),
                if (_stores.isNotEmpty)
                EditOwnerRegister(
                  Id: widget.ID,
                  store: _stores[0],
                ),
                SizedBox(height: 32.r),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> getStore() async {
    await _storeModel.getStores(widget.ID);
    _storeModel.stores.stream.listen((list) {
      setState(() {
        _stores.addAll(list);
        print(_stores[0].state);
        print("got it");
      });
    });
  }
}

class EditOwnerRegister extends StatefulWidget {
  EditOwnerRegister({Key? key, required this.Id,required this.store }) : super(key: key);
  Store store;
  var Id;
  @override
  State<EditOwnerRegister> createState() => _EditOwnerRegisterState();
}

class _EditOwnerRegisterState extends State<EditOwnerRegister> {
  //dropdown options for type of business
  var business_owner ;
  final List<String> _businessTypes = ['کافه', 'رستوران'];
  final _formKey = GlobalKey<FormState>();
  html.File? _image;

  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      String _base64String = base64.encode(bytes);
      _logo = _base64String;
      final blob = html.Blob([bytes]);
      setState(() {
        _image = html.File([blob], pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }


//form field variables

  final _storeModel = StoreViewModel();
  final _viewModel = OwnerViewModel();
  final List<Owner> _owners = [];
  late String _title = widget.store.title!;
  late String _logo = widget.store.logo!;
  late int _business_type = widget.store.business_type!;
  late String _business_type_text = _businessTypes[_business_type];
  late String _state_text;
  late int _state = widget.store.state!;
  late String _city = widget.store.city!;
  late String _address= widget.store.address!;
  late String _owner_phone_number = widget.store.owner_phone_number!;
  late String _telephone_number = widget.store.telephone_number!;
  late int _tables_count = widget.store.tables_count!;
  late String _instagram_page_link = widget.store.instagram_page_link!;
  @override
  void initState() {
    super.initState();
    _title = widget.store.title!;
    _logo = widget.store.logo!;
    _business_type = widget.store.business_type!;
    _business_type_text = _businessTypes[_business_type];
    _state = widget.store.state!;
    _city = widget.store.city!;
    _address= widget.store.address!;
    _owner_phone_number = widget.store.owner_phone_number!;
    _telephone_number = widget.store.telephone_number!;
    _tables_count = widget.store.tables_count!;
    _instagram_page_link = widget.store.instagram_page_link!;
    print(_business_type_text);
    findPhone();
  }
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
                                    "ویرایش اطلاعات فروشندگان فست ‌فید",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  // Row 1
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: DropdownButtonFormField<String>(
                                          style: TextStyle(fontSize: 20.w,fontFamily: "IranSansWeb",),
                                          decoration: InputDecoration(
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
                                            errorStyle: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),
                                            labelText: _business_type_text,
                                            hoverColor: Colors.white,
                                            helperText: "* الزامی",
                                            hintText: "انتخاب نوع کسب و کار",
                                            hintStyle: TextStyle(color: Colors.white),
                                            helperStyle: TextStyle(color: Colors.white),
                                          ),
                                          dropdownColor: BlackColor,

                                          items:
                                          _businessTypes.map((business_type) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                business_type,
                                                style:
                                                TextStyle(color: Colors.white),
                                              ),
                                              value: _business_type_text,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _business_type_text = value!;
                                              // TODO index of businestype
                                              _business_type = _businessTypes.indexOf(value)+1;
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
                                          style: TextStyle(fontSize: 20.w,fontFamily: "IranSansWeb",),
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),
                                            labelText: Proviences[_state-1],
                                            helperText: "* الزامی",
                                            hintText: "انتخاب استان",
                                            hintStyle: TextStyle(color: Colors.white),
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
                                          dropdownColor: BlackColor,
                                          items: Proviences.map((province) {
                                            return DropdownMenuItem(
                                              child: Text(
                                                province,
                                                style:
                                                TextStyle(color: Colors.white),
                                              ),
                                              value: Proviences[_state+1],
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _state_text = value!;
                                              _state =
                                                  Proviences.indexOf(value)+1;
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
                                  SizedBox(height: 24.0.h),
                                  // Row 2
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
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
                                            labelText: _city,
                                            helperText: "* اختیاری",
                                            helperStyle:
                                            TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(color: Colors.white,fontFamily: "IranSansWeb",),
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
                                          decoration: InputDecoration(
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
                                            labelText: _address,
                                            helperText: "* اختیاری",
                                            helperStyle:
                                            TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(color: Colors.white,fontFamily: "IranSansWeb",),
                                          onChanged: (value) {
                                            _address = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Row 3
                                  SizedBox(height: 24.0.h),

                                  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
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
                                              errorStyle: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),
                                              labelText: _title,
                                              helperText: "* الزامی",
                                              helperStyle:
                                              TextStyle(color: Colors.white),
                                            ),
                                            style: TextStyle(color: Colors.white,fontFamily: "IranSansWeb",),
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
                                            decoration: InputDecoration(
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
                                              errorStyle: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),
                                              labelText: _tables_count.toString(),
                                              helperText: "* الزامی",
                                              helperStyle:
                                              TextStyle(color: Colors.white),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            style: TextStyle(color: Colors.white,fontFamily: "IranSansWeb",),
                                            onChanged: (value) {
                                              _tables_count = int.parse(value);
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
                                  SizedBox(height: 24.0.h),

                                  // Row 4
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: TextFormField(
                                            decoration: InputDecoration(
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
                                              errorStyle: TextStyle(color: YellowColor,fontWeight: FontWeight.bold),
                                              labelText: _telephone_number,
                                              helperText: "* الزامی",
                                              helperStyle:
                                              TextStyle(color: Colors.white),
                                            ),
                                            style: TextStyle(color: Colors.white,fontFamily: "IranSansWeb",),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            onChanged: (value) {
                                              _telephone_number = value;
                                            },
                                            validator: (value) {
                                              if (value == null || value.isEmpty) {
                                                return "لطفا شماره تلفن فروشگاه را وارد کنید";
                                              }
                                              return null;
                                            },
                                          )),
                                      SizedBox(width: 16.0.w),
                                      Expanded(
                                        child: TextFormField(
                                          decoration: InputDecoration(
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
                                            labelText: _instagram_page_link,
                                            helperText: "* اختیاری",
                                            helperStyle:
                                            TextStyle(color: Colors.white),
                                          ),
                                          style: TextStyle(color: Colors.white,fontFamily: "IranSansWeb",),
                                          onChanged: (value) {
                                            _instagram_page_link = value;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  //logo
                                  SizedBox(height: 24.0.h),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          // width: 50,
                                            height: 130,
                                            child: Column(
                                              children: [
                                                ElevatedButton(
                                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                                                          side: BorderSide(
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      getImage();
                                                    },
                                                    child: Text('افزودن لوگو',style: TextStyle(color:WhiteColor),)),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                //if image not null show the image
                                                //if image null show text
                                                _image != null
                                                    ? Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(8),
                                                    child: Image.network(
                                                      //to show image, you type like this.
                                                      '${html.Url.createObjectUrl(_image!)}',
                                                      fit: BoxFit.cover,
                                                      width: 100,
                                                      height: 85,
                                                    ),
                                                  ),
                                                )
                                                    : Text(
                                                  "",
                                                  style:
                                                  TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ))
                                      ]),
                                  SizedBox(height: 16.h),
                                  //button to submit the form
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 5,
                                        height: 60.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: YellowColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              business_owner = widget.Id;
                                              Store store = Store(
                                                business_owner: business_owner,
                                                title: _title,
                                                logo: _logo,
                                                business_type: _business_type,
                                                state: _state,
                                                city: _city,
                                                address: _address,
                                                owner_phone_number: _owner_phone_number,
                                                telephone_number: _telephone_number,
                                                tables_count: _tables_count,
                                                instagram_page_link:
                                                _instagram_page_link,
                                              );

                                              _storeModel.editStore(store);

                                              Get.toNamed(HomePage,
                                                  arguments:widget.Id);
                                            }
                                          },
                                          child: Text(
                                            'ثبت اطلاعات',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 5,
                                        height: 60.h,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: YellowColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                          ),
                                          onPressed: () {
                                              Get.toNamed(HomePage,
                                                  arguments:widget.Id);
                                          },
                                          child: Text(
                                            'انصراف',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.w),
            ),
            SizedBox(
              height: 20.r,
            ),
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
  void findPhone() {
    // print(code);
    // code to verify the confirmation code entered by the user
    //TODO send code for verification
    _viewModel.searchOwners(widget.Id);
    _viewModel.owners.stream.listen((list) async {
      setState(() {
        _owners.addAll(list);
      });
      if(_owners.isNotEmpty){
        for (Owner item in _owners) {
          _owner_phone_number = item.phone_number??'';
        }
      }
    });
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
