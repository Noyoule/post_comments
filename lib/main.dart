import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_comments/cubit/add/color_cubit.dart';
import 'package:post_comments/views/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider(
        create: (BuildContext context) => ColorCubit(),
      ),
    ], child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: Colors.deepPurple,
          useMaterial3: true,
          fontFamily: "Poppins",
        ),
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    "Post",
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                actions: const [
                  Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.search)),
                ],
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(25),
                  child: TabBar(
                    tabs: [
                      Tab(text: "Posts"),
                      Tab(text: "Mes posts"),
                      Tab(text: "Profile")
                    ],
                  ),
                ),
              ),
              body: const TabBarView(
                children: [
                  PostsPage(),
                  Center(child: Text('Contenu de la recherche')),
                  Center(child: Text('Contenu du profil')),
                ],
              ),
            )
        )));
  }
}
