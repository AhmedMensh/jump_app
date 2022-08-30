import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jumpapp/src/data/models/story_model.dart';
import 'package:jumpapp/src/domain/entities/story.dart';


class Comment extends Equatable{
  final String? text;
  final int? commentId;
  final Story? commentStory;
  final String? by;
  final int? descendants;
  final int? score;
  final int? time;
  final String? type;
  const Comment({this.commentId,this.text,this.commentStory,this.by,this.time,this.score,this.descendants,this.type});

  @override
  List<Object?> get props => [text,commentId,commentStory];

}