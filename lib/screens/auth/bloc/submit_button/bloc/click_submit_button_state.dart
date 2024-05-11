part of 'click_submit_button_bloc.dart';

sealed class ClickSubmitButtonState extends Equatable {
  const ClickSubmitButtonState();

  @override
  List<Object> get props => [];
}

final class ClickSubmitButtonInitial extends ClickSubmitButtonState {}

final class ClickSubmitSuccess extends ClickSubmitButtonState {}

sealed class ClickLoginSubmitButtonState extends Equatable {
  @override
  List<bool?> get props => [false];
}

final class ClickLoginSubmitButtonInitial extends ClickLoginSubmitButtonState {}

final class CLickLoginSubmitButtonError extends ClickLoginSubmitButtonState {
  final bool? success;
  CLickLoginSubmitButtonError({required this.success});

  @override
  List<bool?> get props => [success];
}

final class ClickLoginSubmitSuccess extends ClickLoginSubmitButtonState {}
