import 'package:flutter/material.dart';
import 'package:newsappppppp/controller/newscontroller.dart';
import 'package:provider/provider.dart';

class Newsscreen extends StatefulWidget {
  const Newsscreen({super.key});

  @override
  State<Newsscreen> createState() => _NewsscreenState();
}

class _NewsscreenState extends State<Newsscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Newscontroller>().getnews();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final newsstate=context.watch<Newscontroller>();
    return Scaffold(
    appBar: AppBar(
   leading: const BackButton(),
    
      actions: const [
Padding(
  padding: EdgeInsets.all(8.0),
  child: Icon(Icons.send_sharp,color: Colors.red,),
),
    Padding(
  padding: EdgeInsets.all(8.0),
  child: Icon(Icons.bookmark_add_outlined,color: Colors.red,),
),    
Padding(
  padding: EdgeInsets.all(8.0),
  child: Icon(Icons.mic,color: Colors.red,),
),
      ],
    ),
body: SingleChildScrollView(child: Column(children: [
  Container(width: double.infinity,height: 200,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(newsstate.news!.articles!.first.urlToImage!),fit: BoxFit.cover),)
),
const SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text(newsstate.news!.articles!.first.description ?? "Description"),
)
]
    )));


  }
    }