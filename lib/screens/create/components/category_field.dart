import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_spark/screens/category/category_screen.dart';
import 'package:xlo_spark/stores/create_store.dart';

import '../../../models/category.dart';

class CategoryField extends StatelessWidget {
  CategoryField(this.createStore) : super();

  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
          title: createStore.category.id == ''
              ? const Text(
                  'Categoria *',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                )
              : const Text(
                  'Categoria *',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
          subtitle: createStore.category == Category(id: '', description: '')
              ? const Text('')
              : Text(
                  '${createStore.category.description}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
          trailing: Icon(Icons.keyboard_arrow_down),
          onTap: () async {
            final category = await showDialog(
              context: context,
              builder: (_) => CategoryScreen(
                selected: createStore.category,
                showAll: false,
              ),
            );
            if (category != null) {
              createStore.setCategory(category);
            }
          });
    });
  }
}
