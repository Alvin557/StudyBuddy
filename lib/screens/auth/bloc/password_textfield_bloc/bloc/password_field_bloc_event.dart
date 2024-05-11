part of 'password_field_bloc.dart';

sealed class PasswordFieldBlocEvent extends Equatable {
  const PasswordFieldBlocEvent();

  @override
  List<Object> get props => [];
}

class ValidPasswordEvent extends PasswordFieldBlocEvent {
  final String? password;
  const ValidPasswordEvent({required this.password});
}

class PasswordIconBlocEvent extends Equatable {
  const PasswordIconBlocEvent();

  @override
  List<Object?> get props => [];
}

class PasswordIconClickedEvent extends PasswordIconBlocEvent {
  final bool? state;
  const PasswordIconClickedEvent({required this.state});
}
