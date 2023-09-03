import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_not_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier {

  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message( text: 'Hola amor', fromWho: FromWho.mine ),
    Message( text: 'llegaste del trabajo?', fromWho: FromWho.mine )
  ];

  Future<void> sendMessage(String text) async{
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    if(text.isEmpty) return;
    messageList.add(newMessage);

    if(text.contains('?')){
      herReply();
    }

    notifyListeners();
    scrollToBotton();
  }

  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);

    notifyListeners();
    scrollToBotton();
  }

  Future<void> scrollToBotton() async{
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut
    );
  }


}