


import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel{
  String anwser;
  bool forced;
  String image;

  YesNoModel({
    required this.anwser,
    required this.forced,
    required this.image
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json){

    return YesNoModel(
      anwser: json['answer'],
      forced: json['forced'],
      image: json['image']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'answer': anwser,
      'forced': forced,
      'image': image
    };
  }

  Message toMessageEntity(){
    return Message(
      text: anwser == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image
    );
  }


}