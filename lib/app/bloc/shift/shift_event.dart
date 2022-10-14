part of 'shift_bloc.dart';

abstract class ShiftEvent extends Equatable {
  const ShiftEvent();
  @override
  List<Object?> get props => [];
}

class GetShift extends ShiftEvent {
  const GetShift({required this.id});

  final String id;
  @override
  List<Object> get props => [id];
}
