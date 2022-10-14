part of 'nurse_bloc.dart';

abstract class NurseEvent extends Equatable {
  const NurseEvent();
  @override
  List<Object?> get props => [];
}

class GetNurse extends NurseEvent {
  const GetNurse({required this.id});

  final String id;
  @override
  List<Object> get props => [id];
}

class SetNurse extends NurseEvent {
  const SetNurse({required this.nurse});

  final Nurse nurse;
  @override
  List<Object> get props => [nurse];
}
