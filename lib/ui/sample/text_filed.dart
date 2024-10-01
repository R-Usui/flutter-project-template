import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//In this sample, you can learn...
//1. How to decorate the field
//2. How to focus the field from other Widgets
//3. How to validate the field

class TextFieldSamplePage extends StatelessWidget {
  const TextFieldSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFieldSample(),
            FormSample(),
          ],
        ),
      ),
    );
  }
}

//----------------------------------------------------------------

class TextFieldSample extends StatefulWidget {
  const TextFieldSample({
    super.key,
  });

  @override
  State<TextFieldSample> createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter a text",
          ),
          onSubmitted: (String _) {
            setState(() {});
          },
          focusNode: _focusNode,
        ),
        Text(
          _controller.text == ""
              ? "You haven't submitted anything yet."
              : "You submitted '${_controller.text}.'",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () => _focusNode.requestFocus(),
          child: const Text("Focus"),
        ),
        TextButton(
          onPressed: () {
            _focusNode.unfocus();
            setState(() {});
          },
          child: const Text("Submit"),
        ),
        TextButton(
          onPressed: () {
            _controller.clear();
            setState(() {});
          },
          child: const Text("Clear"),
        )
      ],
    );
  }
}

//----------------------------------------------------------------

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  FormSampleState createState() {
    return FormSampleState();
  }
}

class FormSampleState extends State<FormSample> {
  final _formKey = GlobalKey<FormState>();

  bool _isSnackBarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter a number that is a multiple of 3.",
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: (string) {
              int? number = (string == null) ? null : int.tryParse(string);
              if (number != null && number % 3 == 0) {
                return null;
              } else {
                return "Enter a number that is a multiple of 3.";
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Keep empty here.",
            ),
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return "Do NOT enter anything here.";
              }
              return null;
            },
          ),
          TextButton(
            onPressed: _isSnackBarVisible
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      setState(() => _isSnackBarVisible = true);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                            SnackBar(
                              content: const Text('Submitted'),
                              action: SnackBarAction(
                                label: "Close",
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ),
                          )
                          .closed
                          .then(
                            (_) => setState(() => _isSnackBarVisible = false),
                          );
                    }
                  },
            child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}
