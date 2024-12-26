import 'package:flutter/material.dart';
import 'package:newsappppppp/Dummydb.dart';
import 'package:newsappppppp/view/Newsscreen/newsscreen.dart';

class Latestnewsscreen extends StatefulWidget {
  const Latestnewsscreen({super.key});

  @override
  State<Latestnewsscreen> createState() => _LatestnewsscreenState();
}

class _LatestnewsscreenState extends State<Latestnewsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Latest News",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Dummydb.news.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Stack(
                children: [
                  InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Newsscreen(),));
                  },
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(Dummydb.news[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    bottom: 10,
                    child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contrary to popular belief, ",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 2,
                          ),
                          Text("Lorem Ipsum is not simply random text.",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),maxLines: 2,
                      )
                        ],
                      ),
                  ),
                ],
              ),
            );
          },
              ),
        ),
      ),
    );
  }
}