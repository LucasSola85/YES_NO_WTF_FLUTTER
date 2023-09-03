import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValueChanged;

  const MessageFieldBox({super.key, required this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final inputDecoration = InputDecoration(
      hintText: 'Escribe un mensaje',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      fillColor: color.secondary.withOpacity(0.1),
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        color: color.secondary,
        onPressed: () {
          final text = textController.value.text;
          textController.clear();
          onValueChanged(text);
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        onValueChanged(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
