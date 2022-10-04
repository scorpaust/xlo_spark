import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_spark/components/custom_drawer/error_box.dart';
import 'package:xlo_spark/models/category.dart';
import 'package:xlo_spark/stores/category_store.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({required this.selected, this.showAll = true});

  Category selected = Category(id: '', description: '');

  final bool showAll;

  final CategoryStore categoryStore = GetIt.I<CategoryStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorias'),
        ),
        body: Center(
            child: Card(
                margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 8,
                child: Observer(builder: (_) {
                  if (categoryStore.error != '') {
                    return ErrorBox(
                      message: categoryStore.error,
                    );
                  } else if (categoryStore.categoryList.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final categories = showAll
                        ? categoryStore.allCategoryList
                        : categoryStore.categoryList;
                    return ListView.separated(
                      itemCount: categories.length,
                      separatorBuilder: (_, __) {
                        return const Divider(height: 0.1, color: Colors.grey);
                      },
                      itemBuilder: (_, index) {
                        final category = categories[index];

                        return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(category);
                            },
                            child: Container(
                              height: 50,
                              color: category.id == selected.id
                                  ? Colors.purple.withAlpha(50)
                                  : null,
                              alignment: Alignment.center,
                              child: Text(
                                category.description.toString(),
                              ),
                            ));
                      },
                    );
                  }
                }))));
  }
}
