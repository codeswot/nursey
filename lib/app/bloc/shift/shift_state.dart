part of 'shift_bloc.dart';

enum ShiftStatus { initial, success, error, loading }

extension ShiftStatusX on ShiftStatus {
  bool get isInitial => this == ShiftStatus.initial;
  bool get isLoading => this == ShiftStatus.loading;
  bool get isSuccess => this == ShiftStatus.success;
  bool get isError => this == ShiftStatus.error;
}

class ShiftState extends Equatable {
  const ShiftState({
    this.status = ShiftStatus.initial,
    this.shift,
    this.exception,
  });
  final ShiftStatus status;
  final Shift? shift;
  final String? exception;

  ShiftState copyWith({
    Shift? shift,
    ShiftStatus? status,
    String? exception,
  }) {
    return ShiftState(
      shift: shift ?? this.shift,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [shift, exception, status];
}
