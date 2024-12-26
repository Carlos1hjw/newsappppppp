import 'package:flutter/material.dart';
import 'package:newsappppppp/controller/categorycontroller.dart';
import 'package:newsappppppp/controller/newscontroller.dart';
import 'package:newsappppppp/view/Bottomnavbar/bottomnavbarscreen.dart';
import 'package:provider/provider.dart';


void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => CategoryController(),),
      ChangeNotifierProvider(create: (context) => Newscontroller(),)
    ],
      child: const MaterialApp(debugShowCheckedModeBanner: false,
        home: Bottomnavbarscreen()
      ),
    );
  }
}