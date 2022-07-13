part of 'newdestination_cubit.dart';

abstract class NewdestinationState extends Equatable {
  const NewdestinationState();

  @override
  List<Object> get props => [];
}

class NewdestinationInitial extends NewdestinationState {}

class NewDestinationLoading extends NewdestinationState {}

class NewDestinationSuccess extends NewdestinationState {
  final List<DestinationModel> newdestinations;

  NewDestinationSuccess(this.newdestinations);

  @override
  List<Object> get props => [newdestinations];
}

class NewDestinationFailed extends NewdestinationState {
  final String error;

  NewDestinationFailed(this.error);

  @override
  List<Object> get props => [error];
}
