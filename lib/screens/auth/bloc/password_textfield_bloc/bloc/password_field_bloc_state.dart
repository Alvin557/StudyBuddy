part of 'password_field_bloc.dart';

sealed class PasswordFieldBlocState extends Equatable {
  final String? value;
  const PasswordFieldBlocState({required this.value});

  @override
  List<String?> get props => [value];
}

final class PasswordFieldBlocInitial extends PasswordFieldBlocState {
  const PasswordFieldBlocInitial({required super.value});
}

final class PasswordFieldError extends PasswordFieldBlocState {
  const PasswordFieldError({required super.value});
}

final class PasswordFieldSignUpError extends PasswordFieldBlocState {
  const PasswordFieldSignUpError({required super.value});
}

final class PasswordFieldSuccess extends PasswordFieldBlocState {
  const PasswordFieldSuccess({required super.value});
}

class PasswordIconBlocState extends Equatable {
  final bool? clickedState;

  const PasswordIconBlocState({required this.clickedState});

  @override
  List<bool?> get props => [clickedState];
}

class PasswordIconClickedState extends PasswordIconBlocState {
  const PasswordIconClickedState({required super.clickedState});
}

class PasswordIconInitialState extends PasswordIconBlocState {
  const PasswordIconInitialState({required super.clickedState});
}
