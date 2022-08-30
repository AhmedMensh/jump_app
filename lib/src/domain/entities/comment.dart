import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jumpapp/src/data/models/story_model.dart';
import 'package:jumpapp/src/domain/entities/story.dart';


class Comment extends Equatable{
  final String? text;
  final int? commentId;
  final Story? commentStory;
  const Comment({this.commentId,this.text,this.commentStory});

  @override
  List<Object?> get props => [text,commentId,commentStory];

}