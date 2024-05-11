import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_field_bloc_event.dart';
part 'password_field_bloc_state.dart';

class PasswordFieldBloc
    extends Bloc<PasswordFieldBlocEvent, PasswordFieldBlocState> {
  PasswordFieldBloc() : super(const PasswordFieldBlocInitial(value: null)) {
    on<ValidPasswordEvent>((event, emit) {
      if (event.password == null) {
        emit(const PasswordFieldBlocInitial(value: null));
      } else if (event.password!.isEmpty) {
        emit(const PasswordFieldError(value: 'Please enter a password!'));
      } else {
        emit(const PasswordFieldSuccess(value: null));
      }
    });
  }
}

class PasswordIconBloc
    extends Bloc<PasswordIconBlocEvent, PasswordIconBlocState> {
  PasswordIconBloc()
      : super(const PasswordIconInitialState(clickedState: false)) {
    on<PasswordIconClickedEvent>(
      (event, emit) {
        print(event.state);
        emit(PasswordIconClickedState(clickedState: event.state));
      },
    );
  }
}
