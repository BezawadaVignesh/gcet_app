import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gcet_app/common/common.dart';
import 'package:gcet_app/bloc/auth_bloc.dart';
import 'package:gcet_app/db/user_repository.dart';
import 'package:gcet_app/pages/home/home_page.dart';
import 'package:gcet_app/pages/login/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

// void main() {
//   Bloc.observer = SimpleBlocDelegate();
//   final userRepository = UserRepository();

//   runApp(BlocProvider<AuthenticationBloc>(
//     create: (context) {
//       return AuthenticationBloc(userRepository: userRepository)
//         ..add(AppStarted());
//     },
//     child: App(userRepository: userRepository),
//   ));
// }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Asdf'),backgroundColor: Colors.blue,),
      )
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  const App({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gcet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(37, 65, 173, 1)),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return const SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return const MyHomePage(title: 'Gcet');
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationLoading) {
            return const LoadingIndicator();
          }
          // print(state);
          return SplashPage();
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:gcet_app/pages/blog_page.dart';
// import 'package:gcet_app/pages/login.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Gcet',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color.fromRGBO(37, 65, 173, 1)),
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//       initialRoute: '/',
//       routes: {
//         '/':(context) => MyHomePage(title: "Gcet"),
//         '/login':(context) => LoginPage(),
//       },
//       // home: const LoginPage(), //const MyHomePage(title: 'Gcet'),
//     );
//   }
// }

