import 'package:flutter/material.dart';
import 'package:flutter_proj_template/localize/dictionary.dart';
import 'package:flutter_proj_template/localize/localized_string.dart';

class DrawerSamplePage extends StatefulWidget {
  const DrawerSamplePage({super.key});

  @override
  State<DrawerSamplePage> createState() => _DrawerSamplePageState();
}

class _DrawerSamplePageState extends State<DrawerSamplePage> {
  int _selectedIndex = 0;

  static const List<LocalizedString> _pageTitles = [
    LocalizedDictionary.home,
    LocalizedDictionary.business,
    LocalizedDictionary.school,
  ];

  static List<LocalizedString> get _pageBodyTexts => List.generate(
        _pageTitles.length,
        (index) =>
            LocalizedDictionary.index +
            LocalizedString(" $index: ") +
            _pageTitles[index],
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (_LocalizedStrings.drawerMenu +
                  const LocalizedString(" ") +
                  LocalizedDictionary.sample)
              .of(context),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: Text(
          _pageBodyTexts[_selectedIndex].of(context),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      drawer: Drawer(
        width: 200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                _LocalizedStrings.drawerMenu.of(context),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ...List.generate(
              _pageTitles.length,
              (index) {
                return ListTile(
                  title: Text(
                    _pageTitles[index].of(context),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  selected: _selectedIndex == index,
                  onTap: () {
                    _onItemTapped(index);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _LocalizedStrings {
  static const drawerMenu = LocalizedString(
    "Drawer Menu",
    {
      Language.japanese: "サイドメニュー",
      Language.kana: "さいどめにゅー",
    },
  );
}
