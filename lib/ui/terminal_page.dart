import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/route/pages.dart';

class TerminalPage extends StatelessWidget {
  const TerminalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: Pages.values.skip(1).map((page) {
        return TextButton(
          onPressed: () {
            context.go(page.path);
          },
          child: Text(page.path),
        );
      }).toList(),
    );
  }
}
