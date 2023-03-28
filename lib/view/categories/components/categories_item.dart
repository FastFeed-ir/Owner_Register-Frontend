import 'package:flutter/material.dart';

import '../../../model/models/collection.dart';
import '../../../model/models/product.dart';

class CategoriesItem extends StatefulWidget {
  const CategoriesItem({super.key});

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
  final List<Collection> _collections = [];

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
                                  child: Text(product.description)),
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
    if (title.isNotEmpty) {
      setState(() {
        _collections.add(Collection(title: title));
        _collectionTitleController.clear();
      });
    }
  }

  void _deleteCollection(Collection collection) {
    setState(() {
      _collections.remove(collection);
    });
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

  void _showAddProductDialog(Collection collection) {
    _productUnitPriceController.clear();
    _productTitleController.clear();
    _productDescriptionController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            alignment: Alignment.centerRight,
            child: const Text('افزودن محصول'),
          ),
          content: Column(
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
                    collection.products ??= [];
                    collection.products!.add(Product(
                      title: title,
                      description: description,
                      unitPrice: unitPrice,
                    ));
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

  void _editProduct(Collection collection, Product product) {
    _productTitleController.text = product.title;
    _productDescriptionController.text = product.description;
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

  void _deleteProduct(Collection collection, Product product) {
    setState(() {
      collection.products!.remove(product);
      if (collection.products!.isEmpty) {
        collection.products = null;
      }
    });
  }
}
