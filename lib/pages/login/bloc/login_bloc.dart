import 'package:bloc/bloc.dart';
import '../../../bloc/auth_bloc.dart';
import 'package:gcet_app/db/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required this.userRepository,
    required this.authenticationBloc,
  }) : super(LoginInitial()) {
    on<LoginButtonPressed> (
      (event, emit) async {
        emit(LoginInitial());

        try {
          final user = await userRepository.authenticate(
            username: event.username,
            password: event.password,
          );

          authenticationBloc.add(LoggedIn(user: user));
          emit(LoginInitial());
        } catch (error) {
          emit(LoginFaliure(error: error.toString()));
        }
      },
    );
  }
}
