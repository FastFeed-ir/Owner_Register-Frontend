import 'dart:ui';

import 'package:FastFeed/view/categories/components/text_form_field.dart';
import 'package:FastFeed/view/categories/components/text_form_field_number.dart';
import 'package:FastFeed/view_model/collection_view_model.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../model/entity/collection.dart';
import '../../model/entity/product.dart';
import '../../utils/constants.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.storeId});

  final int storeId;

  @override
  CategoriesScreenState createState() => CategoriesScreenState();
}

class CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _collectionTitleController =
      TextEditingController();
  final TextEditingController _productTitleController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productDiscountPercentageController =
      TextEditingController(text: "");
  final TextEditingController _productInventoryController =
      TextEditingController(text: "");

  var _checkBoxValue = false;
  var _gotFromServer = false;
  final List<Collection> _collections = [];
  final _viewModel = CollectionViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerRight,
          child: const Text('دسته بندی ها'),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Image.asset(
                  OwnerPageimg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 600,
                child: Material(
                  color: Colors.white,
                  elevation: 8.0,
                  shadowColor: Colors.grey,
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16.0),
                        Form(
                          key: _formKey,
                          child: textFormField(_collectionTitleController,
                              'عنوان دسته بندی', true),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _addCollection();
                            }
                          },
                          child: const Text('افزودن دسته بندی'),
                        ),
                        const SizedBox(height: 16.0),
                        Expanded(
                          child: !_gotFromServer
                              ? loading()
                              : ListView.builder(
                                  itemCount: _collections.length,
                                  itemBuilder: (context, index) {
                                    Collection collection = _collections[index];
                                    return expandedCard(collection, index);
                                  },
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
    );
  }

  Widget expandedCard(Collection collection, int index) {
    return Card(
      child: ExpansionTile(
        title: Container(
          alignment: Alignment.center,
          child: Text(collection.title),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _showEditCollectionDialog(index, collection),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteCollection(collection),
            ),
          ],
        ),
        children: [
          if (collection.products != null)
            ...collection.products!.map(
              (product) => ListTile(
                title: Container(
                  alignment: Alignment.center,
                  child: Text('${product.title} : '
                      '${product.unitPrice.toString().toPersianDigit().seRagham()} تومان'),
                ),
                subtitle: Container(
                    alignment: Alignment.center,
                    child: Text(product.description ?? '')),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () =>
                          _showEditProductDialog(collection, product),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteProduct(collection, product),
                    ),
                  ],
                ),
              ),
            ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Container(
              alignment: Alignment.centerRight,
              child: const Text('افزودن محصول'),
            ),
            onTap: () => _showAddProductDialog(collection),
          ),
        ],
      ),
    );
  }

  Widget collectionDialog(int index, Collection collection) {
    return AlertDialog(
      title: Container(
        alignment: Alignment.centerRight,
        child: const Text('ویرایش دسته بندی'),
      ),
      content: Form(
          key: _formKey,
          child: textFormField(_collectionTitleController, 'عنوان', true)),
      actions: [
        TextButton(
          child: const Text('لغو'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('تایید'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _editCollection(collection);
            }
          },
        ),
      ],
    );
  }

  Widget productDialog(Collection collection, Product? product, bool flag) {
    var stateTitle = '';
    if (flag) {
      stateTitle = 'افزودن محصول';
    } else {
      stateTitle = 'ویرایش محصول';
    }
    return AlertDialog(
      title: Container(
        alignment: Alignment.centerRight,
        child: Text(stateTitle),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textFormField(_productTitleController, 'عنوان', true),
              const SizedBox(height: 8.0),
              textFormField(_productDescriptionController, 'توضیحات', false),
              const SizedBox(height: 8.0),
              textFormFieldNumber(
                  _productUnitPriceController, 'قیمت', true, false),
              const SizedBox(height: 8.0),
              textFormFieldNumber(_productDiscountPercentageController,
                  'درصد تخفیف', false, true),
              const SizedBox(height: 8.0),
              textFormFieldNumber(
                  _productInventoryController, 'تعداد', false, false),
              const SizedBox(height: 8.0),
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Checkbox(
                        value: _checkBoxValue,
                        onChanged: (newValue) {
                          setState(() {
                            _checkBoxValue = newValue!;
                          });
                        },
                      );
                    },
                  ),
                  const Text('فعال بودن')
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('انصراف'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('تایید'),
          onPressed: () {
            if (flag && _formKey.currentState!.validate()) {
              _addProduct(collection);
            } else if (!flag && _formKey.currentState!.validate()) {
              _editProduct(collection, product!);
            }
          },
        ),
      ],
    );
  }

  void loadData() {
    _viewModel.getCollections(widget.storeId);
    _viewModel.getProducts(widget.storeId);
    _viewModel.collections.stream.listen((listCollections) {
      _viewModel.products.stream.listen((listProducts) {
        setState(() {
          _gotFromServer = true;
          _collections.addAll(listCollections);
          for (var collection in _collections) {
            collection.products = [];
            for (var product in listProducts) {
              if (product.collectionId == collection.id) {
                collection.products!.add(product);
              }
            }
          }
        });
      });
    });
  }

  void _addCollection() {
    String title = _collectionTitleController.text.trim();
    int storeId = widget.storeId;
    if (title.isNotEmpty) {
      var collection = Collection(title: title, storeId: storeId);
      _viewModel.addCollection(collection).asStream().listen((collectionId) {
        collection.id = collectionId;
        setState(() {
          _collections.add(collection);
          _collectionTitleController.clear();
        });
      });
    }
  }

  void _addProduct(Collection collection) {
    var title = _productTitleController.text.trim();
    var description = _productDescriptionController.text.trim();
    var unitPrice = _productUnitPriceController.text.trim();
    var discountPercentage = _productDiscountPercentageController.text.trim();
    var inventory = _productInventoryController.text.trim();
    if (title.isNotEmpty && unitPrice.isNotEmpty) {
      Product product = Product(
        title: title,
        description: description,
        unitPrice: double.parse(unitPrice.toEnglishDigit()),
        isAvailable: _checkBoxValue,
        discountPercentage:
            double.tryParse(discountPercentage.toEnglishDigit()),
        inventory: int.tryParse(inventory.toEnglishDigit()),
        collectionId: collection.id ?? 0,
        storeId: widget.storeId,
      );
      _viewModel.addProduct(product).asStream().listen((productId) {
        product.id = productId;
        setState(() {
          collection.products ??= [];
          collection.products!.add(product);
          _productTitleController.clear();
          _productDescriptionController.clear();
          _productUnitPriceController.clear();
          _productDiscountPercentageController.clear();
          _productInventoryController.clear();
          _checkBoxValue = false;
        });
        Navigator.pop(context);
      });
    }
  }

  void _editCollection(Collection collection) {
    String title = _collectionTitleController.text.trim();
    if (title.isNotEmpty) {
      collection.title = title;
      _viewModel.editCollection(collection);
      setState(() {
        collection.title = title;
        _collectionTitleController.clear();
      });
      Navigator.pop(context);
    }
  }

  void _editProduct(Collection collection, Product product) {
    var title = _productTitleController.text.trim();
    var description = _productDescriptionController.text.trim();
    var unitPrice = _productUnitPriceController.text.trim();
    var discountPercentage = _productDiscountPercentageController.text.trim();
    var inventory = _productInventoryController.text.trim();
    if (title.isNotEmpty && unitPrice.isNotEmpty) {
      Product newProduct = Product(
        title: title,
        description: description,
        unitPrice: double.parse(unitPrice.toEnglishDigit()),
        isAvailable: _checkBoxValue,
        discountPercentage:
            double.tryParse(discountPercentage.toEnglishDigit()),
        inventory: int.tryParse(inventory.toEnglishDigit()),
        collectionId: collection.id ?? 0,
        id: product.id,
        storeId: widget.storeId,
      );
      _viewModel.editProduct(newProduct);
      setState(() {
        var index = collection.products?.indexOf(product);
        collection.products?.replaceRange(index!, index + 1, [newProduct]);
        _productTitleController.clear();
        _productDescriptionController.clear();
        _productUnitPriceController.clear();
        _productDiscountPercentageController.clear();
        _productInventoryController.clear();
      });
      Navigator.pop(context);
    }
  }

  void _deleteCollection(Collection collection) {
    _viewModel.deleteCollection(collection);
    setState(() {
      _collections.remove(collection);
    });
  }

  void _deleteProduct(Collection collection, Product product) {
    _viewModel.deleteProduct(product);
    setState(() {
      collection.products!.remove(product);
    });
  }

  void _showEditCollectionDialog(int index, Collection collection) {
    showDialog(
      context: context,
      builder: (context) {
        return collectionDialog(index, collection);
      },
    );
  }

  void _showAddProductDialog(Collection collection) {
    _productTitleController.clear();
    _productDescriptionController.clear();
    _productUnitPriceController.clear();
    _productDiscountPercentageController.clear();
    _productInventoryController.clear();
    _checkBoxValue = false;
    showDialog(
      context: context,
      builder: (context) {
        return productDialog(collection, null, true);
      },
    );
  }

  void _showEditProductDialog(Collection collection, Product product) {
    _productTitleController.text = product.title;
    _productDescriptionController.text = product.description ?? '';
    _productUnitPriceController.text = product.unitPrice.toString();
    _productInventoryController.text = product.inventory.toString();
    _productDiscountPercentageController.text =
        product.discountPercentage.toString();
    showDialog(
      context: context,
      builder: (context) {
        return productDialog(collection, product, false);
      },
    );
  }
}
