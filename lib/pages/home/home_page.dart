import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcet_app/bloc/auth_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool logedIn = false;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black,
        onTap:(value) {
          if(value==3) {
            BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: "Blogs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_rounded),
            label: "Attendance",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "Logout",
           
          )
        ],
      ),
      drawer: Drawer(

        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Blogs"),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const BlogPage()),
                // );
              },
            ),
            ListTile(
              title: const Text("Attendance"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Logout"),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context)
                        .add(LoggedOut());
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              // child: Image.asset(
              //   "lib/assets/logo.png",
              //   scale: ,
              // ),
              // child: Icon(Icons.g_mobiledata, size: 37,),
            ),
            Text("GCET")
          ],
        ),
      ),
      body: const Center(child: Text("Hello World")),
    );
  }
}
