import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_proj_template/route/pages.dart';

class DebugTerminalPage extends StatelessWidget {
  const DebugTerminalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var page in Pages.values)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    width: 400,
                    child: TextButton(
                      onPressed: () {
                        context.go(page.path);
                      },
                      child: Text(
                        page.path,
                        //),
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
}
