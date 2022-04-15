import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_spark/components/custom_drawer/page_tile.dart';

import '../../stores/page_store.dart';

class PageSection extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStore.SetPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            pageStore.SetPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Conversa',
          iconData: Icons.chat,
          onTap: () {
            pageStore.SetPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            pageStore.SetPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'A Minha Conta',
          iconData: Icons.person,
          onTap: () {
            pageStore.SetPage(4);
          },
          highlighted: pageStore.page == 4,
        )
      ],
    );
  }
}
