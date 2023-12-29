import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{}

class GetUserList extends UserEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}