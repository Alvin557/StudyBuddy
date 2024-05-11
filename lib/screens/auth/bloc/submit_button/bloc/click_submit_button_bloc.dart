import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'click_submit_button_event.dart';
part 'click_submit_button_state.dart';

class ClickSubmitButtonBloc
    extends Bloc<ClickSubmitButtonEvent, ClickSubmitButtonState> {
  ClickSubmitButtonBloc() : super(ClickSubmitButtonInitial()) {
    on<ClickSubmitButtonEvent>((event, emit) {
      bool isEmailValid(String email) {
        // Basic email validation using regex
        // You can implement more complex validation if needed
        return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
      }

      if (event.confirmPassword == event.password &&
          event.email!.isNotEmpty &&
          isEmailValid(event.email!)) {
        emit(ClickSubmitSuccess());
      }
    });
  }
}

class ClickLoginSubmitButtonBloc
    extends Bloc<ClickLoginSubmitButtonEvent, ClickLoginSubmitButtonState> {
  ClickLoginSubmitButtonBloc() : super(ClickLoginSubmitButtonInitial()) {
    on<ClickLoginSubmitButtonEvent>((event, emit) {
      bool incorrectCredential = false;
      const loginEmail = "sudip@gmail.com";
      const loginPasword = "sudip@123456";
      bool isEmailValid(String email) {
        // Basic email validation using regex
        // You can implement more complex validation if needed
        return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
      }

      if (loginEmail == event.email && loginPasword == event.password) {
      } else if (event.email!.isEmpty ||
          event.password!.isEmpty ||
          !isEmailValid(event.email!)) {
        emit(CLickLoginSubmitButtonError(success: incorrectCredential));
      } else {
        emit(CLickLoginSubmitButtonError(success: !incorrectCredential));
      }
    });
  }
}
