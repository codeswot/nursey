part of 'nurse_bloc.dart';

enum NurseStatus { initial, success, error, loading }

extension NurseStatusX on NurseStatus {
  bool get isInitial => this == NurseStatus.initial;
  bool get isLoading => this == NurseStatus.loading;
  bool get isSuccess => this == NurseStatus.success;
  bool get isError => this == NurseStatus.error;
}

class NurseState extends Equatable {
  const NurseState({
    this.status = NurseStatus.initial,
    this.nurse,
    this.exception,
  });
  final NurseStatus status;
  final Nurse? nurse;
  final String? exception;

  NurseState copyWith({
    Nurse? nurse,
    NurseStatus? status,
    String? exception,
  }) {
    return NurseState(
      nurse: nurse ?? this.nurse,
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [nurse, exception, status];
}
