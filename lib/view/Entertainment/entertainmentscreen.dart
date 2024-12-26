import 'package:flutter/material.dart';
import 'package:newsappppppp/Dummydb.dart';

class Entertainmentscreen extends StatefulWidget {
  const Entertainmentscreen({super.key});

  @override
  State<Entertainmentscreen> createState() => _EntertainmentscreenState();
}

class _EntertainmentscreenState extends State<Entertainmentscreen> {
  @override
  Widget build(BuildContext context) {
    return catopenscreen();
    
  }

  catopenscreen() {

    return DefaultTabController(
    length: 2,
    child: Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: const BackButton(color: Colors.white,),
              expandedHeight: 200, // Height of the app bar
              pinned: true, // Keeps the app bar visible when scrolling
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/images/Entertainmentnewsss.jpg", // Replace with your asset image
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
                title: const Text(
                  "Entertainment",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: Dummydb.news.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  children: [
                    Container(
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
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contrary to popular belief, ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          Text(
                            "Lorem Ipsum is not simply random text.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
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
    ),
  );
  }
}
