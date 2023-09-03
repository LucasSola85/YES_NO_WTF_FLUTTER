import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;

  const HerMessageBubble({Key? key, required  this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme.secondary;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              message.text.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),

        _ImageBubble(message: message),

      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final Message message;

  const _ImageBubble({Key? key, required this.message}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Image.network(
          message.imageUrl.toString(),
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, loadingProgress) => 
            loadingProgress == null
            ? child
            : SizedBox(
              width: size.width * 0.7,
              height: 150,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ),
      )
      );
  }

}
