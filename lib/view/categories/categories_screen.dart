import 'package:FastFeed/view_model/collection_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../model/entity/collection.dart';
import '../../model/entity/product.dart';

class CategoriesItem extends StatefulWidget {
  const CategoriesItem({super.key, required this.storeId});

  final int storeId;

  @override
  CategoriesItemState createState() => CategoriesItemState();
}

class CategoriesItemState extends State<CategoriesItem> {
  final TextEditingController _collectionTitleController =
      TextEditingController();
  final TextEditingController _productTitleController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productUnitPriceController =
      TextEditingController();
  final TextEditingController _productDiscountPercentageController =
      TextEditingController();
  final TextEditingController _productInventoryController =
      TextEditingController();

  var _checkBoxValue = false;
  final List<Collection> _collections = [];
  final _viewModel = CollectionViewModel();

  @override
  void initState() {
    super.initState();
    getCollections();
    getProducts();
  }

  void getCollections() {
    _viewModel.getCollections();
    _viewModel.collections.stream.listen((list) {
      setState(() {
        _collections.addAll(list);
      });
    });
  }

  void getProducts() {
    _viewModel.getProducts();
    _viewModel.products.stream.listen((list) {
      setState(() {
        for (var collection in _collections) {
          for (var product in list) {
            if (product.collectionId == collection.id) {
              collection.products = [];
              collection.products!.add(product);
            }
          }
        }
      });
    });
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _collectionTitleController,
              decoration: const InputDecoration(
                hintText: 'عنوان دسته بندی',
              ),
              onSubmitted: (_) => _addCollection(),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addCollection,
              child: const Text('افزودن دسته بندی'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _collections.length,
                itemBuilder: (context, index) {
                  Collection collection = _collections[index];
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
                            onPressed: () => _editCollection(index, collection),
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
                                child: Text(
                                    '${product.title} : ${product.unitPrice} تومان'),
                              ),
                              subtitle: Container(
                                  alignment: Alignment.center,
                                  child: Text(product.unitPrice.toString())),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () =>
                                        _editProduct(collection, product),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () =>
                                        _deleteProduct(collection, product),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addCollection() {
    String title = _collectionTitleController.text.trim();
    int storeId = widget.storeId;
    if (title.isNotEmpty) {
      var collection = Collection(title: title, storeId: storeId);
      _viewModel.addCollection(collection);
      setState(() {
        _collections.add(Collection(title: title, storeId: storeId));
        _collectionTitleController.clear();
      });
    }
  }

  void _addProduct(Collection collection) {
    var title = _productTitleController.text.trim();
    var description = _productDescriptionController.text.trim();
    var unitPrice = _productUnitPriceController.text.trim();
    var discountPercentage = _productDiscountPercentageController.text.trim();
    var inventory = _productInventoryController.text.trim();
    if (title.isNotEmpty &&
        description.isNotEmpty &&
        unitPrice.isNotEmpty &&
        discountPercentage.isNotEmpty &&
        inventory.isNotEmpty) {
      Product product = Product(
        title: title,
        description: description,
        unitPrice: double.parse(unitPrice),
        isAvailable: _checkBoxValue,
        discountPercentage: double.parse(discountPercentage),
        collectionId: collection.id ?? 0,
      );
      _viewModel.addProduct(product);
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
    }
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
        return AlertDialog(
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text('افزودن محصول'),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _productTitleController,
                  decoration: const InputDecoration(
                    hintText: 'عنوان',
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _productDescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'توضیحات',
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _productUnitPriceController,
                  decoration: const InputDecoration(
                    hintText: 'قیمت',
                  ),
                  textAlign: TextAlign.right,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _productDiscountPercentageController,
                  decoration: const InputDecoration(
                    hintText: 'درصد تخفیف',
                  ),
                  textAlign: TextAlign.right,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  controller: _productInventoryController,
                  decoration: const InputDecoration(
                    hintText: 'تعداد',
                  ),
                  textAlign: TextAlign.right,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
                const SizedBox(height: 8.0),
                Row(
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
                    const Text('موجود بودن')
                  ],
                ),
              ],
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
                _addProduct(collection);
              },
            ),
          ],
        );
      },
    );
  }

  void _editCollection(int index, Collection collection) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text('ویرایش دسته بندی'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _collectionTitleController,
                decoration: const InputDecoration(
                  hintText: 'عنوان',
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('لغو'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('تایید'),
              onPressed: () {
                String title = _collectionTitleController.text.trim();
                if (title.isNotEmpty) {
                  setState(() {
                    collection.title = title;
                    _collectionTitleController.clear();
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _editProduct(Collection collection, Product product) {
    _productTitleController.text = product.title;
    _productDescriptionController.text = product.description ?? '';
    _productUnitPriceController.text = product.unitPrice.toString();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('ویرایش محصول'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _productTitleController,
                decoration: const InputDecoration(
                  hintText: 'عنوان',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _productDescriptionController,
                decoration: const InputDecoration(
                  hintText: 'توضیحات',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: _productUnitPriceController,
                decoration: const InputDecoration(
                  hintText: 'قیمت',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('انصراف'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('تایید'),
              onPressed: () {
                String title = _productTitleController.text.trim();
                String description = _productDescriptionController.text.trim();
                double? unitPrice =
                    double.tryParse(_productUnitPriceController.text.trim());
                if (title.isNotEmpty && unitPrice != null) {
                  setState(() {
                    product.title = title;
                    product.description = description;
                    product.unitPrice = unitPrice;
                    _productDescriptionController.clear();
                    _productTitleController.clear();
                    _productUnitPriceController.clear();
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteCollection(Collection collection) {
    _viewModel.deleteCollection(collection);
    setState(() {
      _collections.remove(collection);
    });
  }

  void _deleteProduct(Collection collection, Product product) {
    setState(() {
      collection.products!.remove(product);
      if (collection.products!.isEmpty) {
        collection.products = null;
      }
    });
  }
}
