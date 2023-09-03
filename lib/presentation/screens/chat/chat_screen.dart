import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/widgets/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

import '../../../domain/entities/message.dart';
import '../../providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
   
  const ChatScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         title: const Text('Mi Amor ♡'),
         centerTitle: false,
         leading: const Padding(
           padding: EdgeInsets.only(left: 12),
           child: CircleAvatar(
              backgroundImage: NetworkImage('https://media.a24.com/p/6f1455f36d13bfcb458baa036af78ac2/adjuntos/296/imagenes/009/207/0009207578/1200x675/smart/soledad-fandino-2jpg.jpg'),
           ),
         ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        child: _ChatView()
        ),
    );
  }
}

class _ChatView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  final chatProvider = context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: ( _ , i) {
                  final message = chatProvider.messageList[i];
                  return message.fromWho == FromWho.mine
                  ? MyMessageBubble(message: message)
                  : HerMessageBubble(message: message);
                  
                },
              ),
            ),
            MessageFieldBox(
              onValueChanged: chatProvider.sendMessage,
            ),
          ],
        ),
      )
    );
  }
}